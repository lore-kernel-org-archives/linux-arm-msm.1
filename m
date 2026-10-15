Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4C04F3914
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054753; cv=none; b=nxLIFzDkn/5UnlXjllTUQzNbKG5xilfkiclCGE9PyisaQYzzWmUq+UNdti+sGH05lU1YLcMhSPPX2Q1ZGfh27FcTfBI13C0KAKxDQ8XV2rbGGN8/I8hJWkqO89KtvU0m9JPgKBCikVcB2yqKEudWt2j2jOza9vowFziUvpGjSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054753; c=relaxed/simple;
	bh=xBbaNwaZ04U9vu5xMLAzqewhXtCtgpwBmq9365lh0RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWmEeQ4tud+ZE0TeLOASn5nKrGW5hbW34+1oDx89zQxbclcOoIfPmDa064sWdxPq06jVWcpwvnflOIe35tp7xpKcmSRZNDYDp77+XHqOBeylq/RNiRsjRy9UwDJhlmOnHnNkHt+xXncVEWCz2pxn/KoS7kMZlXEnd2riMZhdKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cf6dno0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AuoizofG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cf6dno0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AuoizofG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7BXsX2121415
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SN5oCd+hB1kN6I2RUJR2/JZbM+ngr/PeEqa7S6xoQS0=; b=cf6dno0ecdLTK9C5
	A9+Xyr6WvOyg4SDyK5jrG8l6nCbmLIrxkT4PaHQ9Qogaiq4Orr3F3GXJoRU2MUWv
	f0ia+l61o/NzIyDL91yxDby5fVZlV+MneZA0ZUq6+N3IRDEw7nAURV5mcw9ODL62
	iiFdugaMtjEOFXHhS0QDoe5rUUSqoetFPJev9gJ8dhz6KNLPhZ6WiGMDpApngRp5
	ebl+O6j2b64DGNetsYads+vF8RSpc5Hk9tqPiacO+xGJnVNon4tZvYBD291tbg7A
	Lp/R/+VGZuneoQQTf0D+dJGpSkrbEHOXelcipNb8Kl6WYqbi/RdWiF6dhObq3653
	t7p8GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1uqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso253345085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054746; x=1792659546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SN5oCd+hB1kN6I2RUJR2/JZbM+ngr/PeEqa7S6xoQS0=;
        b=AuoizofGJbscgJbKp69Kmt/sjMZ96hwc0ffS4JN880ThOUXCVDdCY62tTV0AnhVCvL
         M3LE4eq7uOf3AImSjnQUzV25oPA2UIzFAQNIYKcw7mkJsydgXvoY42fMy0mD3ZgSOgd+
         XVMtyrTpDYcSaU96SpAPe085j/ezPaB9fkgRqfGin+W9V/ILn89KE1yvrFJfYi7Jr1Bf
         srZMVWSROVb35bSM6QtEl6Gmzmz+Ui6kWHNxEIxgR5gXPjQKS+ch9LEx3QxbbMlBfXOu
         2WsJQ8cpD48phEkuixfF8hrxK7dTUeA2Ubt9d5W231sDNHwb2YaiHg01e5vpPkCBU//b
         Hmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054746; x=1792659546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SN5oCd+hB1kN6I2RUJR2/JZbM+ngr/PeEqa7S6xoQS0=;
        b=a3KEw3Vs0NQnziuWupl9yWzC6QlkB1cgx2YofBEqIJqIPle53l4L1BSGQEvTVBNYZf
         b1rQDJdkNPb//zw9FvMtfPEFT+wNMIhuhxGSORTfpS9DKUgeCUUFiowyzQhFvY0cDHVA
         QyZMCIdWZURCFnzjT/79wqjF9i3UeyrPEt3ou8A8w8nqEJN3UGbel6OfmbTmmOmu9xx0
         xvtQLAEafznNODwwiinnM8HwafyanfjjxXTTj2hHaKnWpOxhMJrRSR3F/37KEwG9pNJd
         bO6NbsVewFFnVItnJap5budVRmy23FKJT/XmUp0go4DjB1D3het/rspleEZN9/zYBRdk
         9gfA==
X-Gm-Message-State: AFq9FYK1i3ux/9ehOsAxdAsJOdWLLRBLhVO9CIMAkUbMxgQQ2nH9leGs
	e0ndOAB3+2JLePFXWq8Wlq8dXLI4KKslWCzbeztvZeP44I10LkC0L6i283nJTLXvcoqVNakpfC2
	eFAsu4vg951pX2c5gr9AK5iCEMAUGj8FiKMZn6N8Jvc0wQA2IKe5kIKjIS6N7l7Oydbwv
X-Gm-Gg: AYBFou3SMhRy+XaHN4kJNrhqjVmD1zK5suhKtBvtbk3Xx66UqUyuUhADjAsG4FQ8cbA
	WQuoUX0z2EU3I1hI+4GcCVkZZ8AZcajlq6oTfQ2g3UBrBpyCsxx6ngmB0PLTBueyYRIp3KJF5yn
	alMUr6wod1+vN/xyIbJpunhop4K2jhiU5tbHRKFNdgkTZgCtz+P4K/FtUJH7Q6MnZ+RXdcbS7jC
	kK9CVmwEjne4HOm7WO+fSdw+CYbMf32sgCmPvkeW7MbCP8l04Vq3nr4B+ymT35/o/ft5ziy7FTX
	FzT34qc7CBLgeSlVnT0OTeVd0WHWa0p/quCLVCvN37ETjSz0ydIyQM1PX9skeYw92B0ics0TOGp
	mXukRz0ym7aYEJfPazTjhQS5CoXz0JecIBM4RMvq50ojTEP9XJR7OFFobTlF23wt+xPOabBxWCL
	gUviSdIfDeB0j1
X-Received: by 2002:a05:620a:6489:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ebd20830bmr2693239685a.36.1792054745898;
        Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6489:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ebd20830bmr2693238285a.36.1792054745505;
        Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:45 +0300
Subject: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xBbaNwaZ04U9vu5xMLAzqewhXtCtgpwBmq9365lh0RI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXHgIL+ILyWEGstfQf8V4lw5nKNfZbOlQ6Ls
 JoUbd46i3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxwAKCRCLPIo+Aiko
 1VJaB/9k5Pu4lNZ5NrTjERYf0kQUmOOugVGCg+f56hXaS9WyML/RdJFoZSw1QgeWJdCZU206QDn
 TEmCrYkOuwLEFluHrqIzBvAZXz/Fs935E0zcQHI/E3uR3ISKlqR+urAmffPXe5Yb2kVytPoGLfz
 WNz/6sJJ8FHkVKmYSiGECHcfOVbvoR0FnJfwB2bSUBpqScPulDIKRQqsy2r7sRaSrMuwEfoZH2o
 LCSMuO3uBfZzwtmMIirwn4v3lLlHY01VYpGnxf65IOu+KBbqpyyb3hxnLwtpZYQEnguJ9eAXq1f
 fgsVo5CWGYYnPYNKZ9s5OLZztUyf9lJY0mi6Otj8qWRp5/QY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX3DloermnKVGn
 PUG+eGx2lolgmsTZUMyCBLBfllbyb5Us1JD2Ki1YDC7W5KN8jyIhl3rUzZigml5oggARfZyPcON
 J/R8q0AAb1mRy0Q6TEdHOp/VPfLKKVfShqvdz2PeiGbIoxuED84PFXvX2p5/x8SlMp1PNOmkUui
 fVOHQ1vz6Oxne9ZpAv5oRCzuz+CETawLFcuWRCnwfLR9u8rMu6nQfV0oZorKCg1hD3pS0ioqy6U
 DfqOF9G3sa/u4psNE9dmfjr+dQWdeccNrwkM1zrjUZflGCt2XJgxCVWou/R1WKQONDc/O/ZLKb9
 t+G86mS3IXW1CfGq9LvfAxT3Qm81g1kKQvZcWAd2KTftgwCAkU7exb2YFD5+/Tt1adQgmfH5oIc
 VbnRhNG7ZlCfa1TxKKbZo1DDOo4LBXv8Jghm/rZa3iG1ikIzAaNoPg1Tiq1HXCaB7HUKsDiDys9
 YEQiUSvSF4NJiDqMT/g==
X-Proofpoint-GUID: QADRmKlwqU_6NuqpbJvEdgAN_73AwLSA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfXwGbpHHvAdj9Y
 qrIBc/6N/95Ell6/3SF8U7+nPH7tuGKvGbvAYJgkWxsaxOavPLhfL2srdcedGeQ5de8R8HZQh9r
 U61loklCE3lkF+R+gr0sHsjzlyo7Y60=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad095da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LxeP0AzRrgEWglGlbvkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QADRmKlwqU_6NuqpbJvEdgAN_73AwLSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150035

The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
the wrong address the mux driver fails to probe, the Type-C controller
and the DisplayPort controller keep waiting for it and the display
subsystem never binds.

Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index cdced5c848d3..8f4ea981bb89 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -434,9 +434,9 @@ &i2c4 {
 
 	status = "okay";
 
-	typec-mux@42 {
+	typec-mux@43 {
 		compatible = "fcs,fsa4480";
-		reg = <0x42>;
+		reg = <0x43>;
 
 		interrupts-extended = <&tlmm 152 IRQ_TYPE_LEVEL_LOW>;
 

-- 
2.47.3

