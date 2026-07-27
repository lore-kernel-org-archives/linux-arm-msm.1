Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E72B24BBF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167277; cv=none; b=GDJJNKmlycbuU/A93ATPgPU+oeEmimZyF5zjcvZ+XXNoSyV7ZIH/+Z0r/EN9v1urDxaKlCtXPF9Ns1BiSng7gNEa8Fmiz0qK9ZatmWyR8nFbsFPsiD4tysCaz2Q9TwGFbVwIOCFiTJqktSGDz5IYI7epxrWYU2GWfdPjwXd+eFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167277; c=relaxed/simple;
	bh=zm9bsFytylvX6JSvk/UamkMiaCkb215yq2AsQbRdbvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIjfdfyP7E5N7IeKu1oYUvXjIPMrMgVferYpV4mncRBlYw6fLaFvW6i4sntOC+uvoUqlOm71XQzEG+rvzWqvsQi2ZHRiRXX8nuhfKIB45JebxQheZHlE/LoEaLx0B8ZLG8s3Ee9CqOG1cL7L1HSKDC+/EUiIi3ST6sLFoQgKUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhmYJCXb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dB0W+Oj8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhmYJCXb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dB0W+Oj8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlX5x855701
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOkfamEWx04fg/3rjrIG2V8/umLoBHLDYdgpSy+thJ8=; b=PhmYJCXbwl91wW1M
	fJKlRRZzCeIaOibHnBbHoozz4Ixs1MwXc0XTe39c8FN983UXbWRx+vWQ6lBeNtoJ
	rmTHF0zFGVihaAiVzmQQ5MR0yy3IqwMDITTK6FCBwY36IgxfKm1qIYzA9v+uHGyB
	wVA/0eIm1KdSOn/EH5YzukXbN+HZAunpzyvp3PL8zsd3ivBBSdpGxDxvboKPzFoi
	Ae9QY1vsFkclfVabF1OrV2xHPlnKBowT1WuU2ZuvA+Qipq5Rbq88rceYfhPpZ0ro
	0WJmyGT/2jF5zsbzktkuIhWkNd0TKsFTNahzua5m4rrvwB46VlPoXjOXSgRz3at+
	3jytnw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wju6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a67b16217so59223b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167273; x=1785772073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOkfamEWx04fg/3rjrIG2V8/umLoBHLDYdgpSy+thJ8=;
        b=dB0W+Oj8eSgrrVjQmD5jVqXug1Y/VLLWFSVogFuw/1ulCq8f2cLR689vWwOaRof6oH
         AlZ9Uepfn9PBfDDE4GzniFwJSSHXuHY4WqtzO0fY94s2MHIKURU5jjTeCa7jk8dd8EHV
         TcmvVpPfCsUjzgDpmKYJLRH3ujwr+k/3pp+oVptKctWLDXg8Nru9GHzVgf1D/Cy2IDj/
         EY44Wy0JdMYX1JU6eSeVk5xRGLxIcxXaNFEI/kHP9de45hXMse/o+Zi8D7XUX1ox+0hi
         8J21dYIWVyI4xgMaqvumqu+oq4MhzbQxif939e14WtPQk6oA0DntsZuhXY86qTEKNPf+
         Nbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167273; x=1785772073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOkfamEWx04fg/3rjrIG2V8/umLoBHLDYdgpSy+thJ8=;
        b=kwfv9+uU40gM5XshGJqZrKECm0NRVaKCLZcl62P0h3iDiDpu4nnusbvJ//I8NmOuCi
         GO9IwMkP0qzQMOppEposHoFtU0V6kBOk6Hy3D3jkeHSZMQGhpmWeM1hdHHcCPyBSugLO
         4ae2dRYPYHKHSizJ8nLe+XsH36VYZfobUmSHUPs5tlmF50wJCEb2Js/XroITWwHJqVEC
         6eRnR7TAH0opvtZa9/cW3rIaZonfKUwg1Fos2y//qIuMlucW+FVC6qiCYJtxlBHm5YCa
         ISv/skHH7/ByAz/lGh9iGuWYzFkinnYEQ8JHxVkdLVLu5hrrTyu1hvdYaksTb3A2+jM0
         zVOg==
X-Gm-Message-State: AOJu0Ywn70EiPor0Px9bhIpznkPAKZbh3Z1AivHTp9ayxT7XggcQnszF
	+4CpkinJWgd+D7rjSz5VLcomxnABLKzZN50w2HIH3hNMJ5u5pOCvcXPg7WVuU0xPGzhBJ/bAxH9
	M+1+iBy6kXANoMmfJE3xTWOaGXjUNFpxxzqD2YroWS8Jcb3DqwdIH5RNxHnotCHQMsJRV
X-Gm-Gg: AR+sD13ruB2V+pEdTuGJZrCqT4+tvnQeEhZyXyl5Htwkwc6aIHmrEoec06s8e2+ZP0j
	zTx2cGRzllyw2XAY8BWXY8MjAJ0DYJbPK35xOVNnNi51d6HrG7fmVFhUXYmlXfl+aoL765xzZyC
	ZN4roqt77xGGrMdchykj0SAqg5ld2tN4w0XUL6Yjzl9p3iVAHtKIyxbUduO5fdLrAiTQmR7Cou/
	WlBRQy83L6DATcz5bt0ITRE7Vmh1Gmp/4wqtdo6hV/9N5Dt0QQp9QwDezhmB7gNyoZHDa0cCu7E
	soy6vC28C3DtI/lBO6cc0b0w1EKkzpsa6S7VOdpF58/piebX25KWG9kUhIefEAQf8n1gHJAvId4
	aeuf2fsP2YbggJMZhnpIJXyVTwmdq2w6cVxa3nEFN+/C5PJyboIBP5/Su9gyeWXEROuL/LeEG4P
	8wCY38ejL8KDPaVbCxMgqhqmSidgBabngGPto=
X-Received: by 2002:a05:6a21:1398:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3c67da14622mr8252582637.17.1785167272983;
        Mon, 27 Jul 2026 08:47:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:1398:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3c67da14622mr8252532637.17.1785167272419;
        Mon, 27 Jul 2026 08:47:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm32845204eec.9.2026.07.27.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:17:36 +0530
Subject: [PATCH v11 2/3] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-wdt_reset_reason-v11-2-eeedb22beefe@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
In-Reply-To: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX66vDKQflFNwz
 sfsAwvlw5A8EHO5vlrY5qRazyCwaqoy/NdaAB2Elt+psKDJX9ejgxPnhkuJojyej0bkczuZRaML
 pJLx7GjD5DF5hEv1ue5CLpgx4PGQcV6WzJac+WOIxxo74Z6BLDT8m6CFYnpnLZBqz6hRy/yZrx2
 iE9FG6l6atvjlLyL6u6O9VQvi6lNd3OMySWHjL5KPPETUoGtpJCAAkJX50+t7df76zjzr4WI8ve
 gAvoXewmbSY1je0mtFs6EhV04BlqlO2BfNRCh7zyL5muOuugvEHDRcDI7kAAAdPhje7YoJ19VYC
 NuF/7pHwrZyIcsWueBN7Czgffri9N9LrjX17RpViBM47hhGlkOQHNCeHYnS/0Serz/+fUqc7XHA
 77fWx1vR6zgK06kNRN/oeYySJKtfOQcqxwuZE9MygSlv8ERYIb9j92/vGKxC7uPC8qZ3MieaYhX
 8JuOSAoKocaSKOtbkPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX2UvujOJT5WSh
 8JTX5B3nRW+HQZ8HInlzCj75eDIxeJN4ifWke38vC0hAEZ6BdS90otSGqwHrUPLi4S11Jst5r4c
 bm9rUg5RvosB0MGN3Ua9i9eBWaLjItA=
X-Proofpoint-ORIG-GUID: q4_VYxeFoUeg2zcimhleKuKxO9YktqxW
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a677da9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: q4_VYxeFoUeg2zcimhleKuKxO9YktqxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 702061e16a58..ed61db0749f8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -730,6 +730,17 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8af8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1

