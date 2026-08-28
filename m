Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BF047012F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925941; cv=none; b=rWxj2ydU75VLISMvx3eN6ZHnztc/pKcjkwClp1ORG9qIk7zFr9dt/J0SFlA4sOzm+xt+nMlIqV/QXA0YMqguT9baU9K+XbkVhuIfrf+krpE6tkTmaL+Zk4NvkKfXdoOOrWTHkJLCCbiZyeIZtMSllyCupeLi7i/Mb2nx/YpN00Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925941; c=relaxed/simple;
	bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PENXHNL/i4umTZ/hCFEQNHdL8InBczOF7XahW6RCBTxZadP/fNc1P5dXHaf3dab/G2kO480gDdr3EtbePIvo4oOi4QqGtbGziq8HmXaAtR10MfUYtNNGACfh1070fNYWsP3MZotbHJCnaVdHDg8LBA5F+Djvhi3uHITv1PJpiAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gi03dk5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1AQ9LW3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gi03dk5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1AQ9LW3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkcQC3226288
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=; b=gi03dk5S8dPzpK6H
	5Jr3NrN5ftZNDTgS+nXu6GOYO8qbA2SxYUJnNMT1MgnexuKo3ydjNxqQXVfaUuxq
	Fnwg57Kh/o46B72HXjMahgg6W71oRhRgEy0lZXZisbfTAIWeYu5ICmXhh54h1k9M
	krGFCXdW5hmYO3PJnIuUsMrea/2XV7oJ+KZ2DiOtaEc4vMaOufBJMvMF5TjYL/7i
	umKLWatKGBvePJPPCnBYKbayOi7RTVJ2Q6VUYKjfRVLutjp75gXvVjkZIKtCdj3E
	90t85bH9oa9zsIkDN+hx/gm/rKBbgZ1ClWRcyVo1OCCorRhHRyE+zI+aVRWzuM/E
	bgXZQA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxt3ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso7857641cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925938; x=1788530738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=f1AQ9LW3o5FW7242H/qKc232H8qIRsCOEMNuV87wpAyrAgjZtk5qZ/K9cmHa8I1KNz
         uwOoPb+qKvEGdpRgZj94gj6RHXZzkLhmt2x3sTUuX9gcVGcs0ZNwswr0jIYPpZPiH23m
         2edFaFop+HInhyAGnRtwcbns2R/vBsIAmFpnZhwu6SRtxlQihR7T1Pvnlv/27aUMcM1F
         A6199FT3OVZwupf7yZWXPdR0+kVXVBtpeqj14D6NJn6oOQIX3EkcXPTuaQYCYcR4eqBg
         VJt1GgmJO88Oi9CumJcxfBsvnYdReWFVuSUteDz+MQfxx7eG/dLhJSOrjRVKIk7+dPb8
         3F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925938; x=1788530738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=gpKUESvq4cxC1h/QvN3+JsKQUlKLrj2q+DYGSGBDvEJ7kCjkT2Y77qQSYLms/gAHzb
         e0yPkactlCrfK4KwdDlkDrVr6nEB04AN6lndafX4ng4SsitCiQTxZeGu/wNHjNDvMLUT
         z8e/dJoF9WWb2RGA8OWxqBjXP4uVhNJX9hXqvPPwPl313VYFP/Z+lwkYwK3JdWvU7piC
         WVoGtJ2v+pAY2TFfenxSa4q80nW9kTsNtunh2O0g9VULfTJWrqmGdLDljo73LO5sz9u2
         HLiKaNvX+HevKIchvhPsA+lqoMDQSdICHDzaQFMcOKNl/5WjVOiaHjsCnBermi1Z++1U
         dtNA==
X-Gm-Message-State: AFuF++lkFhK2/7rKXlnShszITdkS2tgVH8Af4V0USxsbmEGQ/YUGRYIb
	IPDHCmRAOgIhRfK8xV1bLvz/CwVbQRHFrKfuJjjr4xufUWss3JHQjM9ih0+4V527WKPXZAPnzD7
	+oQWhDJ++Hz99fVtJHIxu/ISvjgg+HNLWbFMBYIHXurtI8aX3dpbsYan0mPuwmIl9qiqU
X-Gm-Gg: AR+sD104lt150FqobZ+CN3UEX6KEKjzdzvBN+7qTcrSqd9MOX9DrCPNVM9FZ5kQ+jbt
	1VjccemAwn6zSKtaPgY2uPJTbNNNdlhTquj2pnZdMt87icJUDQfdoBMBq+jQ1BVSjvvYKUl5H72
	fDzOCA2PEY6eGMJSuj7H7zx6sIqKts8o1cVIQCyU8yQkHflLbOVQcAtivhQl7WfFW2KMa9d9Axx
	S+Ei3Lx6rvVeti/MJ7Srkmp5kENzBszb+VGFNXP4NA6yaJPspAEGLNfhZOZMk1+hI6oo3LeA4Op
	pD0DQvw09yUPqk0mghriFXfl/QscL2aJFwoGTDhDKQ0c7t6NHxPGJkPZLnC9hpPuNACn6LJlp5q
	Paq/V6OBdFJ5NJRAVokdaqzs=
X-Received: by 2002:a05:622a:14e:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52fb940f94emr74674311cf.9.1787925937896;
        Fri, 28 Aug 2026 07:05:37 -0700 (PDT)
X-Received: by 2002:a05:622a:14e:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52fb940f94emr74672371cf.9.1787925937232;
        Fri, 28 Aug 2026 07:05:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:02 +0200
Subject: [PATCH RFC/DO NOT MERGE 04/12] dt-bindings: display/msm: hdmi:
 Correct name of disallowed supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-4-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWbJu9iixJwm9XNddPSZcVmCxWgF0WLJqc2x
 esPt9B+9uWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmwAKCRDBN2bmhouD
 19VjD/4v1r5Juz7BMmixRhI1GYLMqcc3Wnor8vlc0z4pT+CFHeP9LTVl0BDJqVlC0jFUzbtFRNR
 JbL7AEEgjUy6LnwG4HmNYOplyQR8aUDIbCyFw4lwud14ssL/67IQzlID3OnW305TgvYYe/myfcK
 4lgXwmAr/5OM42lY/tCkbvG63YwRSPx3SnzFyrLVExL4+02BvNK60ahBF5TmZU1uNUf4i+/6AzJ
 1jUlscemAPuFpOdM5jI77M6mkvL9eOcKIEqW+Uvk/0+BgNw6d0L8N0cJySUpT15iyVb7V3jJfge
 o9PuvzxTcoT/xaAAAwVsPfZ0Y01pI7yJ87DNHeu8W6vF/nJk9o0pBHsFqHSN12AdkLsTiTnpmF9
 HaQIiTX/LGfW5V6vhZjAwpfb84vxs3p5jB6VdYpc0H+y+Q3T8DX5z58LBrJWtyw50zyCgWwTsll
 +np7qWem/Zt+cmRDtB6fH0eZQHq+PbT37zduRfnvS5GVFGQxZ7SgXwqUg/OATHtHjU+Ng8ADkaP
 9FBGkPnrPWucubtx3c9U9LGfgcCSX6KwJAGpARyfuSeZd5BG5cHXYo7kFRn3lpkH08T5yqKtaOM
 st688zOzCrg9xdtvZrXgZsb7wS5FTmd7MD62+3alvLvG1oQ/bdPw7iLZJj22Wj6FY4FFTuvaLoV
 Ua1sGS095TT4eAw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX6Khq+Mrbu2FJ
 qmEuqWFfXALQcey7FSoVA4bkQPNHTq0SjaeNG4ucMlOr6b8M21EXVbK6Yvo6+EtzTsOVDksDUa6
 2+rOmI2Ocgc3uSLArVa10KWq+q0YQ3eS9nrPDR/FQVwOEunFJSqVxaL/z6li2HLOIBnFAY9xfZC
 I5KxDEXBApPUWvVEPVtJucMI8AUdCVA0GlnPpFB+JDjDKseGZ95BocJpweKiE9evLTI2YM0BmiZ
 H/+UMHdPt4bLprfYEOzhfVSTwLkhOnzj2NErNZldWGBsa1Qjl8NzDMO7S6ZjoMhXyLiWapGpjMQ
 KpRDE5cqHoO+RfiV3OW9NRgbF2yiADnyrjL+DjSAeS3SIEYBaPulAxtwf8vJ35nFUs8codJwCTK
 FT878LmidufzZGuT7bEFstRuXWK7kRUjcPVw+3CBgRwYXEYvccX41Ur/h1zHpl1k/cu7I9lSuDV
 yKdWBke33kI87qi05hw==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a9195b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LSMMCDwwRte7x3nqQVUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX91r/8qENBtIV
 HC6hk1S6iHEJNN9YtQd/79deiVRPSbFoyGJ8Jp0v4O2kcngALqxHvpQ+pKHlJyd8reP353Kk4zQ
 QtWGE5Xf6+6Lj++A+EFyqnaF23YwD3Y=
X-Proofpoint-ORIG-GUID: ugUHgllZyMrDT2ZMLMGN9GTlPDr0m7Ui
X-Proofpoint-GUID: ugUHgllZyMrDT2ZMLMGN9GTlPDr0m7Ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

There are no properties in DTS or Linux drivers called
"core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
wanted "-supply" properties instead.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index dfec6c3480f3..02d27ccad024 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -113,7 +113,7 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
-        core-vcc-supplies: false
+        core-vcc-supply: false
 
   - if:
       properties:
@@ -136,7 +136,7 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
-        hdmi-mux-supplies: false
+        hdmi-mux-supply: false
 
   - if:
       properties:

-- 
2.53.0

