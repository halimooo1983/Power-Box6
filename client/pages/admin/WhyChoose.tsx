import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { Badge } from "@/components/ui/badge";
import {
  Save,
  Upload,
  Image as ImageIcon,
  Link as LinkIcon,
} from "lucide-react";
import { supabase } from "@/lib/supabaseClient";
import { logError } from "@/lib/error-utils";

interface Benefit {
  title: string;
  description: string;
  color: string;
  image: string;
}

interface WhyChooseData {
  title: string;
  benefits: Benefit[];
}

const defaultWhyChooseData: WhyChooseData = {
  title: "Why Choose Our Nutritious Snack Box?",
  benefits: [
    {
      title: "Variety of Snacks",
      description:
        "Perfect mix of breakfast bars and savory snacks for any time of day",
      color: "blue",
      image: "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F4d9abe9f679440fcb3470285697707f4?format=webp&width=800",
    },
    {
      title: "High-End Packaging",
      description:
        "Attractive and professional packaging that makes a great impression",
      color: "purple",
      image: "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F6305c43f8b6449fc8926c50b002e25fe?format=webp&width=800",
    },
    {
      title: "Grab-and-Go Convenience",
      description: "Individually packaged snacks perfect for busy lifestyles",
      color: "green",
      image: "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F26b950db7e9644baa7113c5a0046d0fa?format=webp&width=800",
    },
    {
      title: "Suitable for All Ages",
      description: "Perfect for adults, teens, and college students alike",
      color: "orange",
      image: "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2Fa7c068e933744309b8f41ed0726156a2?format=webp&width=800",
    },
    {
      title: "Heartwarming Greeting Card",
      description: "Comes with a special greeting card to show you care",
      color: "red",
      image: "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F19d8d6717d2a4dc6b633c9494573527a?format=webp&width=800",
    },
    {
      title: "42 Count Value",
      description: "Generous quantity ensuring lasting satisfaction and value",
      color: "indigo",
      image: "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F74bff8b15ba640b1acf1428f6b9b71b9?format=webp&width=800",
    },
  ],
};

export default function WhyChoose() {
  const [whyChooseData, setWhyChooseData] =
    useState<WhyChooseData>(defaultWhyChooseData);
  const [isSaving, setIsSaving] = useState(false);

  const handleTitleChange = (value: string) => {
    setWhyChooseData((prev) => ({ ...prev, title: value }));
  };

  const handleBenefitChange = (
    index: number,
    field: keyof Benefit,
    value: string,
  ) => {
    setWhyChooseData((prev) => ({
      ...prev,
      benefits: prev.benefits.map((benefit, i) =>
        i === index ? { ...benefit, [field]: value } : benefit,
      ),
    }));
  };

  const handleImageUpload = (
    index: number,
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    const file = event.target.files?.[0];
    if (file) {
      // In a real implementation, you would upload to a storage service
      const imageUrl = URL.createObjectURL(file);
      handleBenefitChange(index, "image", imageUrl);
    }
  };

  const handleSave = async () => {
    setIsSaving(true);
    try {
      console.log("Saving why choose data:", whyChooseData);

      // Simulate API call
      await new Promise((resolve) => setTimeout(resolve, 1000));

      localStorage.setItem("why_choose_section", JSON.stringify(whyChooseData));

      alert("Why Choose section saved successfully!");
    } catch (error) {
      console.error("Error saving why choose data:", error);
      alert("Error saving Why Choose section. Please try again.");
    } finally {
      setIsSaving(false);
    }
  };

  // Load data on component mount
  useEffect(() => {
    const savedData = localStorage.getItem("why_choose_section");
    if (savedData) {
      try {
        const parsed = JSON.parse(savedData);
        setWhyChooseData(parsed);
      } catch (error) {
        logError("Error loading saved data:", error);
      }
    }
  }, []);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h2 className="text-2xl font-bold text-gray-900">
          Why Choose Section Management
        </h2>
        <Button
          onClick={handleSave}
          disabled={isSaving}
          className="flex items-center gap-2"
        >
          {isSaving ? (
            <>
              <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
              Saving...
            </>
          ) : (
            <>
              <Save className="w-4 h-4" />
              Save Changes
            </>
          )}
        </Button>
      </div>

      {/* Main Title */}
      <Card>
        <CardHeader>
          <CardTitle>Section Title</CardTitle>
        </CardHeader>
        <CardContent>
          <Input
            value={whyChooseData.title}
            onChange={(e) => handleTitleChange(e.target.value)}
            placeholder="Enter section title..."
            className="text-lg"
          />
        </CardContent>
      </Card>

      {/* Cards Grid */}
      <div className="grid lg:grid-cols-2 gap-6">
        {whyChooseData.cards.map((card, index) => (
          <Card key={index} className="border-2 border-blue-100">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Badge variant="secondary">Card {index + 1}</Badge>
                {card.title || "Untitled Card"}
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              {/* Card Title */}
              <div>
                <Label htmlFor={`card-title-${index}`}>Title</Label>
                <Input
                  id={`card-title-${index}`}
                  value={card.title}
                  onChange={(e) =>
                    handleCardChange(index, "title", e.target.value)
                  }
                  placeholder="Enter card title..."
                  className="mt-1"
                />
              </div>

              {/* Card Description */}
              <div>
                <Label htmlFor={`card-desc-${index}`}>Description</Label>
                <Textarea
                  id={`card-desc-${index}`}
                  value={card.description}
                  onChange={(e) =>
                    handleCardChange(index, "description", e.target.value)
                  }
                  placeholder="Enter card description..."
                  className="mt-1 min-h-[80px]"
                />
              </div>

              {/* Icon Upload/URL */}
              <div>
                <Label>Icon</Label>
                <div className="flex gap-2 mt-1">
                  <div className="flex-1">
                    <Input
                      value={card.icon}
                      onChange={(e) =>
                        handleCardChange(index, "icon", e.target.value)
                      }
                      placeholder="Icon URL or upload..."
                    />
                  </div>
                  <Button
                    variant="outline"
                    onClick={() =>
                      document.getElementById(`icon-upload-${index}`)?.click()
                    }
                    className="flex items-center gap-1"
                  >
                    <Upload className="w-4 h-4" />
                    Upload
                  </Button>
                </div>
                <input
                  id={`icon-upload-${index}`}
                  type="file"
                  accept="image/*"
                  onChange={(e) => handleImageUpload(index, "icon", e)}
                  className="hidden"
                />
                {card.icon && (
                  <div className="mt-2 p-2 bg-gray-50 rounded-lg">
                    <img
                      src={card.icon}
                      alt="Icon preview"
                      className="w-8 h-8 object-contain"
                    />
                  </div>
                )}
              </div>

              {/* Image Upload/URL */}
              <div>
                <Label>Card Image</Label>
                <div className="border-2 border-dashed border-gray-300 rounded-lg p-4 text-center mt-1">
                  {card.image ? (
                    <div className="space-y-2">
                      <img
                        src={card.image}
                        alt="Card preview"
                        className="max-w-full h-24 object-contain mx-auto rounded"
                      />
                      <div className="flex gap-2">
                        <Button
                          variant="outline"
                          size="sm"
                          onClick={() =>
                            document
                              .getElementById(`image-upload-${index}`)
                              ?.click()
                          }
                          className="flex items-center gap-1"
                        >
                          <Upload className="w-3 h-3" />
                          Replace
                        </Button>
                        <Button
                          variant="outline"
                          size="sm"
                          onClick={() => handleCardChange(index, "image", "")}
                          className="text-red-600"
                        >
                          Remove
                        </Button>
                      </div>
                    </div>
                  ) : (
                    <div className="space-y-2">
                      <ImageIcon className="w-8 h-8 text-gray-400 mx-auto" />
                      <Button
                        variant="outline"
                        size="sm"
                        onClick={() =>
                          document
                            .getElementById(`image-upload-${index}`)
                            ?.click()
                        }
                        className="flex items-center gap-1"
                      >
                        <Upload className="w-3 h-3" />
                        Upload Image
                      </Button>
                    </div>
                  )}
                </div>

                <input
                  id={`image-upload-${index}`}
                  type="file"
                  accept="image/*"
                  onChange={(e) => handleImageUpload(index, "image", e)}
                  className="hidden"
                />

                <div className="mt-2">
                  <Input
                    value={card.image}
                    onChange={(e) =>
                      handleCardChange(index, "image", e.target.value)
                    }
                    placeholder="Or enter image URL..."
                    className="text-sm"
                  />
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Button Configuration */}
      <Card>
        <CardHeader>
          <CardTitle>Section Button</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div>
            <Label htmlFor="button-label">Button Label</Label>
            <Input
              id="button-label"
              value={whyChooseData.button.label}
              onChange={(e) => handleButtonChange("label", e.target.value)}
              placeholder="Enter button label..."
              className="mt-1"
            />
          </div>
          <div>
            <Label htmlFor="button-popup">Popup Modal Link</Label>
            <div className="flex items-center gap-2 mt-1">
              <LinkIcon className="w-4 h-4 text-gray-400" />
              <Input
                id="button-popup"
                value={whyChooseData.button.popup_link}
                onChange={(e) =>
                  handleButtonChange("popup_link", e.target.value)
                }
                placeholder="Enter popup modal link..."
                className="flex-1"
              />
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
