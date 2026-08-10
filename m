Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7813B1031
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362166; cv=none; b=swQ1rXclNstNdTz1T8UGa3rBhwMCy1wTJ4t3sk+QBB5LLxelNt7GHQuFmnmUpuK7vkwNtktKAXunfbzJB7mhH1bYKXsivk/RLoOJuc5iIPRLUwPDi5ZJO7zY+C1iVoSmM8n/ZSIbpOV1k3NmfDJOmPvs9flVKcFOYBwu6xnKMK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362166; c=relaxed/simple;
	bh=XlBDQwSAvxsyZibxTb7GVapBUaLLsh+xxc84Mnw4H68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4avQ9qgdXvOZ+643XPHhCPumZjwkb/AGxK9n3F8DllfDi02PSGY4YBMw0NhgYh2ckCwhRKa2VvQkBpJEBNNlgVgrr9UbiNQrGW8KU1Dg0HpF0eeMRTcf9w0JHsKL8eUbioPhIb1qsCnCKIDBUREfFjf5wVIMs+FbKRTMWujTSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsKZrXYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHfLGRWc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsKZrXYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHfLGRWc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9pYWf904944
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=; b=lsKZrXYzatNB+Gqq
	X9LXTRe9aDno10CTyhSYeHfQVTsukGhJw3eU09yoQmTlkM6AAWs+pRxFsQAYtOTw
	bZRF8/UdKzggeS2lGNTmIx5kgq5nkg8Ug2WrJAv6t++TuRjyoRiw7XhPMgTipL0N
	Y2hPzeP+1238j72o4862/FRCKF03ax73e7K5E3BVzJTUdM+5UWMKMZaRr7I5CtSd
	8JEfGzEcCSXBCpeGdzMo+a7wYVem/VHPfF2nTr0C1geDz4qXfWlzNqACqumuvqLQ
	bFw0rGyN3ankr0gB0TuMrAa5jyVuJ5lmusAGXwLj8XQ0XIqPWgPHBU4pONlaN6pZ
	2elLPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqrd19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso24635771cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362160; x=1786966960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=;
        b=BHfLGRWcnQ6RubyhMCp8uU0NgnQqKf7YtoMpzXdYCKEL7nmMQn6tAgSYIMrygJzyc3
         TUtaSfVEXMUi10+Do1umlG6+KAecogg1FgUATr/j1EjaLKQ2capAD2CtM0xPURNXljmx
         flv4aPxMMfOCf+4T0AVtirJjTWbh1DDptKbhVXJqnYXsAHExlM7XAgjNz/5Jak/L26Ou
         jALMQ4I7HT2zZV0WvsmERXN68PhE4Mk4TUy6a4S6NvC9Wm1j1JIoVcVyL6NNEu0CrEGL
         mjgMsQGFUI4ziDFL5i4t+BxN0MhC39+2tIwdsWZZZxI8BnevF0CY0Vog8BFUw+DrYzNK
         Pf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362160; x=1786966960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=;
        b=CflVhqZjJGSEUfFL6tHqKkby3zNY3Jcf1OdI8HIeGI+uL4OXVCEHI9WSswbihWXWzP
         Mizgq7VFjFx3RXOkQJnGw5Ma6AxL7qiQEl1IhyNs8o5lDumGFbaQJ+HRh7E4zKLPMALQ
         zlV29j7XWi9ikIfiw7IJRYVyYmO6vQWoEQF+zjCnsP3A98+1mxwJaumnZVqB2yC6AfGH
         yXC+AFu1t0lINwTZYoPsp51Xgms6rMru6HcqcTxL4j/7eDZmwxbg7AMXSxtfn8D9ax/4
         b9HDB+c42JAf83cw1IseWcqYROa/ZUvJfI1jvKPYKN8GrA8IpKMCFljeZrGRBOc09C2p
         FbJg==
X-Gm-Message-State: AOJu0YyC3nVPsmQJXr0AkFpTuYCzF6VjOAAggjdyyk4l9JQh89Bdx8Ho
	PfbezyI5U9iBs64ipfVSPLAN8KPIJIs4+fg96YfBjFzuV2zOXBDtkw8ccLqBOn7YfW/AFr/vlh8
	hOnRElNrDOLNAesNYkQln48sowCpjt6zKbblrzVScGqdl02GA1EvXQkgjqdEWlLUQs+57
X-Gm-Gg: AR+sD108auCzzpZgMIAdRll0hUR8Fvf8WbrC+3uFfsg98/jpxD+9HjANBNqr9hKbo8k
	k2+jKO+F9uV5wpdh2rzncaymaceC43VXFCXvJsWrVAnVswptxSz0/6AVAd+re1qtiVFyw3OyHlF
	EqFzBZmT+7Z9s5GM8O6LtoCFLtwBVMn+96aSgqatu1ak0QVmh24hDeLNVOow7VWQrg7nTxHT7eP
	zDlCa7GhkBu9SFt8EX8iYxxGzz6EiTsG6KaE/gZnIIMH6e5HLH+BP8Aivv389Ye5zRuDzIcMDw5
	0jJi/QvOzLd2RvDvuVy0ODd9DGXkF8cNVixYwWTBpWOxZv6chIxanhzl2fg8td5ErWGyt57oHNN
	KnG3bpHUY2Xa9mH0oMUOJ81cTzlvzWOlb5N4BlX195y3pEIfUsfJj5IDn9WY8DHU8QwlqDpE3pp
	n820p6+P2IZAFAew==
X-Received: by 2002:a05:622a:138e:b0:515:189c:e0f8 with SMTP id d75a77b69052e-52ce5fc17b5mr396944831cf.17.1786362160083;
        Mon, 10 Aug 2026 04:42:40 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:515:189c:e0f8 with SMTP id d75a77b69052e-52ce5fc17b5mr396944321cf.17.1786362159555;
        Mon, 10 Aug 2026 04:42:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:32 +0300
Subject: [PATCH 02/10] dt-bindings: phy: qcom,ipq806x-usb-phy-hs: document
 the MSM8974 HS PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-2-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XlBDQwSAvxsyZibxTb7GVapBUaLLsh+xxc84Mnw4H68=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkoHJUasBZkSEQyK8qt7Sa0CbTM1HkKPQd36
 hMtY9nvcoiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KAAKCRCLPIo+Aiko
 1XOPB/9iP+0cBpsURaaS2Nk5a31W2huWOTDf6btKzykDGqqn3mcp3DU9H5VLFMaq4MGjOuyF4WY
 nkWzPdUmUN51RIs2HuSzJNfcrJMj2rTLNTpv3ezNv7SEuucpSmjPy8yY/GMwFMGw0dNH0LrfkIV
 0NNSc6qQjEVEqSld9D2Y21LYYJeX2jsaS45feXcQaZ1LLXq4gEbc5xEC8koGjPSkEVUuVAnPLKk
 8bERkIyLr7tfRqwwYzXa/M23qNvqldkuqdmnIkKrmWZAj9BhXZ6bys+DA8I/yBghagcbJpi0s3T
 XmrOCgvsVnP3ucQPzs2W0rWFZ5akGHFaw+TtT3keCb8IPFYd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: N0bFhBr0GeavpjkD2Kyypo5qe9WKPtoQ
X-Proofpoint-ORIG-GUID: N0bFhBr0GeavpjkD2Kyypo5qe9WKPtoQ
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79b931 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=l4NzwngxL-zSgT35z_IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX2qLGggt/1e9t
 tDzYtU4XIJYtso6ESa+c3w60fQhSnFa0vxwzEv3q2uK/ewqpEr2OEm8jC2qx9IkT9YhJRKq30/p
 zRBFlHb5tuJ7oJ5b8c+PS/i1ekaDha9ZO2x2uUsApGX/KLjUuO6OtqzW9+SH1PPAK9p171aUaxl
 FMEC/GpBE1GJvJDYOYOzBrjDCNKbMu8rWZpYmnw6wWItS8Ih8w5cO//sQQsOF6TWctCltxfWt8y
 5WZ7AZffpJQxR/iVp42pcm6h0Ilj01YboK0nvIsUVQH204Gi2NMRJ53WOcKyJzqJKKoRQW13xbw
 x0pDGp0/gdVZ/aTszuYG1doFlrWHuGeGcSr54nidKOsmAuWfqdt7N2OQYlqf+27s2aseUcfxk4L
 RjzZ+ArWqbKsmA7v84sAbNs4UoXE6ntJ1jEwlBvGEncEez2T12idAWWFw5QSs3wV8AV6NSvuetM
 TFfSBi4ZkAqpUszH+xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX7BE8W3KnI2PA
 ka44//PbGna0gkkGY1uKeF6WyEgJuEaNGMi1H+stMSfjh0wXyrLWeI3/YYogelllGc8oaksF6e2
 bis7bHa0r5zFY7Q9/SCF5G2y4J2kyNg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The MSM8974 DWC3 wrapper contains the same generation of Synopsys 28nm
HS PHY as IPQ806x, controlled through the QSCRATCH registers, but the
binding only covers IPQ806x, leaving the MSM8974 controller to run on
bootloader-configured PHY state.

Add the qcom,msm8974-usb-phy-hs compatible.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
index 35296c588e78..de6f94997d5e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/phy/qcom,ipq806x-usb-phy-hs.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm ipq806x usb DWC3 HS PHY CONTROLLER
+title: Qualcomm ipq806x/msm8974 usb DWC3 HS PHY CONTROLLER
 
 maintainers:
   - Ansuel Smith <ansuelsmth@gmail.com>
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,ipq806x-usb-phy-hs
+    enum:
+      - qcom,ipq806x-usb-phy-hs
+      - qcom,msm8974-usb-phy-hs
 
   "#phy-cells":
     const: 0

-- 
2.47.3

