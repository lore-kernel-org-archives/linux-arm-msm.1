Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD037646E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336833; cv=none; b=Kc/viG2olIwasF8XFkcb9hcGK305GfD2dOlN1+Gr0D+/vsWXsqq8iuCd0zlFc95CYI1+1QROgXU2g9L+gcJQdja8hRyBfbrNbveVpdhunB/uoIcCvGznQoBb4swP6KLRiTY2IIZ6rUFu8H3062sgpxW5qQ9uI/vKNpg5MEr7wPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336833; c=relaxed/simple;
	bh=wPTFUyYCIV3oBIBor1tcJV2n9e7M7X7a3fVGT7srQzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E1uzgsssI5xRWStwJOOJNhBGpEFowdfoCF8j6Yy/Scb9puDn6iNQpxBVafZTyvskO3rF/ba5wiILpg8Shsurnym/netnyeCBeuJ2X2v0ch4+gL+7awnZmWNHxfaHshqN1z14XBIQ3gioWRcb354d5Rzs8Mlh6iRnJPFYuMItCtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDgbxaRT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2BvpogR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDgbxaRT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2BvpogR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VVRh1859288
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 08:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JJj9tTcMGmf0OxkdzmALIC
	bP7nDTsOBenYEkzB3H+2g=; b=pDgbxaRTw+6lZqEfjAslvFMagIyL86C74VNZnq
	eVpogTFHN8wOLNUD693FaXKbqd8jGWWtzU9+LgdTEw+BEolWgThUscTEE8/BEbMf
	i9ypOIjf3qsAzEOrecG0UVbReK/I1mxLNPYfIxAu02P/CybXSFoWJ1roXxc5Keh0
	qX8rD6f/8a7qeNHu9hkj52XZOAVJ7ZXuTlQcTmpl9HXz9ittCIY+KsyIhASbLvQi
	M/gn7qpoow+U7+aHEU/UsxRYbOlE5SIsy0zEt+bABlu75oi8i3d2PEj55VXxM/FR
	tH2JWeZTcvAZbTvaYGRZ8Uy/lA+8MMEz1amRNgLZ+3lUQAHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whhhku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:13:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52f52ccd459so11189901cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788336831; x=1788941631; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JJj9tTcMGmf0OxkdzmALICbP7nDTsOBenYEkzB3H+2g=;
        b=E2BvpogRRrDuMCIoXjuIHNR7mtqfPTcdRLiWXywyZ0C5EJk/I8TqLPFgsTr8Apswhq
         3QwWA+U/VimZtAzniiQZGPzWXcUu8NYgLymd9HvwwEkpusx/QCPu9mnNb75lfUrzGTFp
         SpiTZrabVxduHB2vWx3KhZxKHMiJoXWSbefiWksA1hlv0FvJHX++pp+DmuY8fG/kZvjD
         +dHSt/7dYjmEAV0wBWLEE/M20IKPGBLIe830jbZrQXLVNCG7MjJMQoIQYs8n/OlGokD3
         DhNg9LhX7wRySEUck22mc7p5hBkPAA2cvHSA1fM7ToawO6Ab5W0tiv6Pr9/Cg5lK8QNx
         rnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336831; x=1788941631;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JJj9tTcMGmf0OxkdzmALICbP7nDTsOBenYEkzB3H+2g=;
        b=IEEWOKbID3Zhur7tM+qwQVh9+okgzDe8XGeceyM9xxm8WyBsrdL2aJ8Cw9bEyMctKL
         j0qSJmKU+yTv5kvZtlhUJYv7DwMZ2/Ydh2XELQF2O2PDwsEo+k9mHTY3vEWdgg4h3R6G
         ZjyT4cRoEH4aRRS/7QPuM04RHfuZxHtmWP3cGhgaCsLEFn0dpq9+YBNyXYaAxSt6yVGE
         ewf6JCAnlHC6sOlRX3bDqtjH7X4leVarzu14Tdl0tRc69UQeLuqIqVCWf4EVPhiDBb3p
         7gkbOjjcppwHqfxX/MV0wTwwqW+DV6JFohXmRUQIGH2/RnfNemEjk6k4l+oY0Jc0Ymb1
         m8wg==
X-Gm-Message-State: AFuF++lAFBaMAYRxZ8dQbHqwS9n3NZ5IdIi20wgmUPXmXaHM05CM82cl
	rplNhDp/aah/1ielKN07k20L8EMgNHzAR4EYnFqSKkPejUUQqG5vxQcQ56sP7LZREyylDLjmomz
	yi52zTDUAHdwPRgMazHQ/rLxpJSoVyT3gltoB8zaSXVmYMqSdC3d157YXsThihgeSNAr+
X-Gm-Gg: AR+sD10hSAoS3G93FrVoJTRXV4PmSezo0MufyCimUTMNXqIWExGjQjDTVe5m18C3182
	4NBKIxwGdHheDNMQT5nQxX+xz6BudgJRezbPslmb9j/3dfPUDIESF8lYQdQJvJ22+KHsGYlmF8P
	R+TNSsBvD099DDkeGE8NRTmM7zPL9jAhuxfS7W7ncTEOCXZlL/EcyEl6oHEmvXn+J8bqZKOcQa5
	HCBC3PIdEosQgo9+B7bUd4EUuq/4vZW1WFft+fXgGXNTxzU7eMuF/HHN21ASJoOT8APie6GXkqA
	cQtldMnVXHoDSbBG+oSa4pzPYfKya6OJLX3z0l4dr0NwDNHAzVrbY3D0f1sOyPb7kfm8hej8YTq
	2qzxyyc8=
X-Received: by 2002:a05:620a:4415:b0:934:970a:beb2 with SMTP id af79cd13be357-93960f29cc1mr351106985a.26.1788336830921;
        Wed, 02 Sep 2026 01:13:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4415:b0:934:970a:beb2 with SMTP id af79cd13be357-93960f29cc1mr351059985a.26.1788336825001;
        Wed, 02 Sep 2026 01:13:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm139919745e9.4.2026.09.02.01.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:13:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 11:13:35 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK7al2oC/42OQQ6CMBBFr0K6dggtCsGV9zAs2jJAFSh0oFEJd
 7fgBdz85CV/3vyVETqDxK7Ryhx6Q8YOAcQpYrqVQ4NgqsBMJCJLioRDNRNM2vaAnflIQP8EHKT
 qEJpxgeySCs1TrlFyFhyjw9q8Dv+9/DEt6oF63qV7ozU0W/c+Bni+9/795TlwkLlOayVydcbiZ
 oniaZFdOOnjEKzctu0LzblIf+MAAAA=
X-Change-ID: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wPTFUyYCIV3oBIBor1tcJV2n9e7M7X7a3fVGT7srQzs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBql9q2/PWtyCXb1KlnRAVneQFGC5q3a384bnwPT
 N9X8YeDdTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapfatgAKCRAbX0TJAJUV
 Vp8ED/0XXmpS5ipirN2RpywJYeMP3gbOKlOIO/ARV9dlS184j7pTb5MgLSf+A1RGHHmWNm9BAC9
 kYPza6B4R3vgFGgrAvi/iwLRrXA18DAb5vnoNJZ3h9MuvAEofV5eo2PVxQQrTGnkPsEnf6++wuv
 N6enOgs/oul5AkW6hYGsHjffnhs5V5tW7TB9Iamty57Qyzr+5pTRkFYGyIFfDh9xfEgXXxywIDM
 5gjaSjLnaUczSni65rw5fDjLzyunhGAe43Yvflp2p06pNy+x2/A2royxxmMdk/u2JlF7Rae0ujL
 jaR1W5FFzh4HyGBuHU0x+viwNcj6Io8jZ+Jn38S39rJ0KlbivK/rtIuqkW82oMw1G+9m2OV+dTT
 zld2cjgu99eBfor1ZDWMT49cbfixQMrtfmIoZdhOpiyZ98nOAJPx6pDO46EgdWsmuIaFDu3tc+F
 gYo6it2YWT3kw2G5vIZHB2u05v17pyghZVWNSwR6a7GDWSGPEj+7CchUvNe50wuI3RgZqX5Fqt3
 r4zdUP1ZF8SCVbCF540s3YZlvJX6tA4j+Iwz/t8alVHNKtpO4wfUuKV8NqzhNzypN2vh4koltyl
 284cqKEL1gXwAaaUKFdgo8lfsBPU+yW23CV69o3m23j3u61M9J+AkGma1EmkxWW8DTeEH9+KqtQ
 iFUKfjoOQ98SjWw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97dac0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BoG2368bKbZoxSBLJcsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: dIVfX5pLMP2j89xer5mPFvRPepFtyEUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MiBTYWx0ZWRfXzQLdXQE5hzxR
 0qEr813hfExmLbVPj1woiACVeZUdPVAR5lbvCYbLWhvYqee0M4Od4kgcqCCDyZtF0paVNxMzcoL
 B97Pl4zxjoFZU8u/MMPyOxt8VyMhOmP9uq35HscyHdRw7Hkg1wLKW89ZXUt3rgExwRtGEy5594f
 rk0pnHTCfx4y1toUwHsPSOIqDLqwldYILvbtSsACF7WRH6P1HzL3zdGt6vPeY6OwW5ntaki+6Pn
 H59sHp+k30Gt8tb10IvZXhBqCweJ4MQFeeLk4YgfT5VA5/R9/67I05wRuoHs6G4NU7GHZ17Zqez
 hH9/OFdh78SEf2Jp1tfYxzEYrrh1pvnEKUXtm5Q0NzPmOF7wHFMta5dzv3fEaX7eltrSyXNJfUD
 fspWEI5JMRZJxfnH004AjjSam9avOkbsHCvcdgCIs/iVD5GzZZBu7rjZHSGoQu0a/mvZnRgh7Xp
 JJ7oFyCKbyWFwooKgDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MiBTYWx0ZWRfX6zqrtLMBiUZS
 XhwjNvKWD7gBiBoWOo3/Pg78y1vvxJ3Rd+QIvC2QklsEp5TWw2DWAeciIgHIhRXpa1LkP5RcDE9
 /IBLlJmTT+8R9CTIF87r3CYxw6Ml6sU=
X-Proofpoint-GUID: dIVfX5pLMP2j89xer5mPFvRPepFtyEUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020072

Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260901.
- Picked up Konrad's R-b tag.
- Reworded commit message as Konrad suggested.
- Fixed the zap shader firmware filename.
- Link to v1: https://patch.msgid.link/20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..918f5289ca45 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -374,6 +374,14 @@ &pm7550ba_eusb2_repeater {
 	vdd3-supply = <&vreg_l17b>;
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/eliza/adsp.mbn",
 			"qcom/eliza/adsp_dtb.mbn";

---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

