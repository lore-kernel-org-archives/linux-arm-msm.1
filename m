Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DDF3BD24A
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360424; cv=none; b=fveIv02Zh2HE+NE+w+YlAZdIPbfKok5ZNMGYCv8kUbbHQfmK2Er/yRrywENQR7cP03MevW0K8Nv14AoNn3y5EWHhLfHdP3wHuPd4bamU7Mqe3PPijy9kc1EAXjGpbj0ktdLv5AqR0KhCXoNpUzz9BMUxU8yZDlHMQCDFO/tp7wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360424; c=relaxed/simple;
	bh=zmSsve8sqEAbwl4nnNRwu7JWxP6gMcHDO/OKh1VH84E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eapn1zxmaEIjaSaj3yjOlDaBBlD5MYpS+iW+DLTgpQBX/Ll+iyYtCGhrD8xO8FlQJNZONEpQASEAhq9qGsqlb3IaZcx5GVwuSAzwFVGxGUbLHP4OkvrPgosvEDAoXYw32hqhIR5CSQ3CsTNUV9mxfSa+zbJcsnez6liBGh0NS/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nw+HtS8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nw+HtS8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4AF1F01561
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360422;
	bh=apJ+Wd3xen3OiCkSn7zvoO866Ug5lbpClYMSDMZySoE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Nw+HtS8HuhE+MDZdUnvaFuTM7dmOwksv1xz+De2T1NseC4/RztBkdOOCQkkp2mUOv
	 EbpqK10RGM++KomkBX/jFgCsn1Y7mc/s3lCC2X7QNMkgDS2bJI3ycMrbr3hoKFumYI
	 54VuZ5MqcmylwH/XCmAKTnHRZYkRxHQeq+cu1G9GKmNZ9BcWTztdwa4ydU+knzwrqY
	 j2QxQ6Zd3pJh+XHZfK0PnaXuD8+zU1z3xDbWc3XroDAYlDQHu6Dcj/dwF1bjmAs0Sr
	 +j5KMRc73vSfY9kJt/uEafqLtfPnctafHIZCoRMEswKTC9feCAJvh4J8meFxiHaa80
	 lR0LlGQh0fNkw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so4881649e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:13:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqDMoGYz7B6bazdN0oc3Jw1tropA8Y94WnbGy64+Eb496yGhcJf20wg8xeqtJJETCfjpkkpMjgRMp08/0v/@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxVsu9OGrDGTDI1moTEboWM84IxUfm8V/YwIswQoZ5SwT+3qX
	ewSAKrVT+H+pefiPilw/WXrt8RrinKZIgTWeX0M5wlcS1op/Z++amTbg7h5bCVX3JqZVsGvJffy
	Wq4ZncZz9dgSSEVAC1Lp/bHEWuX02BKTEMRpFw2fipQ==
X-Received: by 2002:a05:6512:3986:b0:5ae:9be8:1ad7 with SMTP id
 2adb3069b0e04-5b30c156af4mr3019492e87.18.1786360421140; Mon, 10 Aug 2026
 04:13:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:13:39 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:13:39 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-1-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-1-c4bc688177dd@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:13:39 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mf1Mk03YXa0aYPSwMr+iZxtUKaQR6Erp3m0oO=g1U4Qpg@mail.gmail.com>
X-Gm-Features: AUfX_mxgJ-CVdRVanRZmxExwdSzq95SDKkVdHawKuf8WIZ0HaFMuUt_H9gU2wxc
Message-ID: <CAMRc=Mf1Mk03YXa0aYPSwMr+iZxtUKaQR6Erp3m0oO=g1U4Qpg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy:
 add named voltage rails and deprecate phy-supply
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Umang Chheda <umang.chheda@oss.qualcomm.com>, 
	Yijie Yang <quic_yijiyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Aug 2026 21:27:57 +0200, Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> said:
> The Qualcomm SGMII SerDes PHY has two distinct voltage supply rails,
> vdda-0p9 and vdda-1p2. The binding incorrectly described only a single
> generic supply via 'phy-supply'.
>
> Deprecate 'phy-supply' and instead add two named supply properties. The
> 0.9V rail draws a peak current of 46 mA and the 1.2V rail draws 15 mA.
>
> Fixes: 97b795125704 ("dt-bindings: phy: describe the Qualcomm SGMII PHY")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> index 90fc8c039219c739eae05cc17108a9a2fc6193df..e573abcb937df914ced25ec87add7955bbba7b87 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> @@ -35,6 +35,17 @@ properties:
>    phy-supply:
>      description:
>        Phandle to a regulator that provides power to the PHY.
> +    deprecated: true
> +
> +  vdda-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to the PHY, which draws a peak
> +      current of 46 mA.
> +
> +  vdda-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to the PHY, which draws a peak
> +      current of 15 mA.
>
>    "#phy-cells":
>      const: 0
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
