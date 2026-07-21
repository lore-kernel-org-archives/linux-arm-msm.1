Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A43BB13A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622369; cv=none; b=X6an5TqVJ9h8QmqT0oOA5CdiWwhX+6go3HCb3DTDGff0o+g1qp50SLz8HHr2r5A7Jf6D51ixc7bTUBN8GW3kZc+PCtTKptfHmiOgfu9ZikX9Vk/wKcshwfAyTWeu/jPPjiTA0r+DlNTgyEeBMfMCGGNK5KPI08d1/PVTfbsrKRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622369; c=relaxed/simple;
	bh=M1vUvvpfcU6is8pbV6WwTEvts83UeWZLOwICJrqoWWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ooLO34/gAscE6RLt7f/iVc+ezBwysQnIxBmNpeTUgNi5KSI3a6gOVgwEzsmq1EonPGnqGC/xWiD7NIKKsMDfgFB89j2ZdbjsCqwrZHdXTYAFQEkag1K79D4GCYuHMHVb+DoB0RazlKMZcKbuk7Yioyy3Pd76UhN0EVycCOH1S9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0KcMHbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvhx9Qfv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0KcMHbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvhx9Qfv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6QTQH3978768
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j38ulgScMZZkU/DUH6XgMNi7oPGQjlhHD0izRPHIJ/8=; b=R0KcMHbp1f7ZGnUe
	iXwe3SJFku8XejrN4tbZR0R4y/rbj1Jg4FRCK4xNZZmM2i0Gdy4oifV4nIiqRUzD
	EG7shXrJkblYkrgfovNxKmQICEgjdgWtH1pANAtN4HSv9+IiS6Ww/xGzzem+FSUF
	SKU8EcI+QV4HXdW35kz5NguHggS0z16jYKO6Lk9vT0CZN879QTUVltQQyuD/TzTk
	4ib4j2L/cqld543e5qeOgrMKoF1kEg3yUcWEJjMLKw3sfCSEulvTBwIALRx95e6I
	opNBr5X3NC98X0QCdboId460jQb3Pyv8FUU7Hl8zT+UdiMnpOFpnlif/cChfpJrc
	mqa0/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv4390u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso4847281cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622365; x=1785227165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j38ulgScMZZkU/DUH6XgMNi7oPGQjlhHD0izRPHIJ/8=;
        b=cvhx9QfvU6sJ6yFmg76qlnKvur2xbjZtchbONAZu9aC/1dZLsGNIx3780+xpHaixfH
         mq0Ix5tw5p3z1lb0l+uajFZAmyiDdfE6fq5pjPkEhERsViVmkq0K0YvXl3UAlwHMiKPR
         FPol4A25FUSXledkMGb4VnHE59S/EoXKd3zDwrxf9GhoryXehNzeBiGpqOpm0pFly0UV
         RIv8nMx8zHiTPATvysreLCRvUkt32cx7zo5DZVCwpg1H6p0Dic7EXRvMmcp7TOsIZrc4
         6rxTAv4vyB4p+OktP8vjbiY9vsEgAW+AObQWoEgsFOYR2uAHdGlXnlQSmeUjxPeu3bV6
         puwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622365; x=1785227165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j38ulgScMZZkU/DUH6XgMNi7oPGQjlhHD0izRPHIJ/8=;
        b=sHV91bxjO3BE5FxkPlzq+AKIdaTpl2CIf6nilyGKgAH7rYulu3WmtvJaTXwaCksOkb
         tikhaVcj/s8kGTBvvx5b5mWjF2V+nMwkXfLbmR4wxG8Y2q89suuuX0SnUMbcfT/3UDaY
         OZjh0Z/K4GalEL5ICzxcOEGYBcThkKt3bv9F4iOLmqV8PXhH8tjsh0QYcctfbfQh3L8u
         v1EFZtav/vEEQqhgW0NsUyllycQ0GPGm3fWubdRBEdNHbqz5zVmtYIW0ajjzZnFmFRyq
         63gWgIr14Z/idEQDpRwlDjIucngkv5czzGlYjnNW/AMQqDokwRNbFoEV+rqrJMD0Yu1x
         GlDg==
X-Gm-Message-State: AOJu0YzAScNRQhCcSxZ5/HUSAcn9/0QUxjxEbBEoUie6Vfusi5SMFABw
	1Yr+gtJbF1YJ0KH5Ls+eNXJTZxJ60j0RcvSYvAcjk/KO0CxUnTgjyvPwXsTE5k2aY0AxYkaT1Zu
	ngtQ5lYpkR8v2duLC+SMbiMyvnJK80OI9uSSaZvLogHquNF+I3nmhKqRKmDzZEwj0PuLr4Jkt4W
	xs
X-Gm-Gg: AfdE7clumENW3rvvCLzKj5EdifJ49nKcebUF3iyiL10bVTY7fndE/jSHsVx5NsdCf04
	scNfCJ4Idv+OO939BxblZXFCfqAXZ4HBqbaHb64wulQ6R9ZJzmCeeFiNaNy6Vj/Um1jJC4TEIlM
	bDt1HuAP3jDFeN9OEXltce4iKhcDmeQOG3TcwFryDBWPdgaKMkS0CV5+wamgvsU86J9b7BoD6T/
	xBkH4YmJFzwgemVLPMwgW4Sx77advoUMvmSAWHOaFinddfBszyfr6D35wbSBUsOrZQiu+2wKAAQ
	OmC91FuUUunkcBuJ5KwsLk6+V5tVVpgGGIHjJw2oU01mdGe45CYeXapiN2ashUoueoCoR6SF+JU
	28qzHsGD7
X-Received: by 2002:ac8:5c91:0:b0:526:75fb:73ad with SMTP id d75a77b69052e-52675fb76f9mr12339501cf.79.1784622364897;
        Tue, 21 Jul 2026 01:26:04 -0700 (PDT)
X-Received: by 2002:ac8:5c91:0:b0:526:75fb:73ad with SMTP id d75a77b69052e-52675fb76f9mr12339281cf.79.1784622364227;
        Tue, 21 Jul 2026 01:26:04 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm66664595e9.7.2026.07.21.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:26:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:25:49 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-add-cdsp-v2-2-e1e52bfb3c12@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=M1vUvvpfcU6is8pbV6WwTEvts83UeWZLOwICJrqoWWg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXy0UX7SCptWFL+7BOFZoncmq+tzHvw/K1LL6U
 tsliZCn3yWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8tFAAKCRAbX0TJAJUV
 Vu9QEACoJxoX05Uaj5xw8l06Qu9r+W4A+nn905yLuK43SMt5oxVDsS9u0a/3TLj/6yQYz7wHWhR
 zJSdvnO6NNSVCz27CxgEbq6orJIRAyTBm5sAJrb3gnWJqvN7bRSW72cMMbAnVxtGIg5iQKJ/RHe
 Kv51g2Ta2amauYpP/ZxrbevninkA+c/n4niF/VV/d7krAFuMPiCSZtyMqFnyjDIoG+I4bLimOyg
 y3T+b6Kfm38jyzHe2pLqKUqdojYb3UVA0Yebqm4nJdd16btv8f5r5zY4/scSOjnq6PbpV8gBfew
 gSRLNUbmdK4ozEw59ABLn5+082RASL5/bvk3prtI1qhgL7kpNl40Xy0Rh9BeExzN80ZwnJuRbJx
 nEustyALUpNwnuoRlopEygi17jhDHOk0uPBV2HPvfFQqKKUGonY+pm7ns1lgnEGMgdFRZnfYxT2
 5aobw8ES//MpUPQ0q73X+vpk/OR2NOhelL+xctCSo4MuaVgmj4IyppwYc5gvwt+u1eUcQ3Rk5HJ
 MB0hSqq6oPCqI7dfu1gQ/dATsU/iIfg5hAP6kBAKTEEbn1rCjRzp3BRy6gdh3FjP8G2aIM+pppL
 6bzzEKbiJ5QByOlFIpnNr8Vlsw7490mNbB9ooJjP/EX0SFvKWqc7tWtzzQIAOvDVIAJlQvN1rHV
 eIdwP0m/HeTa00g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: sL3OggO7JJQHRSF82XrJugT2yGBUB4Jd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfXwT6QEgdTFBiX
 7+iCojhIkySo1kxWSdB1ZvMfqTVN3uJI8y9yzisZ/ns80GMiAx2d/I9Q2Y7fMjZw5GqF3eI3+PX
 9uthqevAeX59Yjwc2ykR3woPyUHZEx/weUgV7eb68i3/9ZwOGDo/iZJ9TOHirECvKVXCZ71uBE3
 bFcuHUNF2Xpe8DcPC38WU3WCXMFhW3O8hQyA75Y7AZ5msvMoNTzcRCt69VhLnMGD0KhavU5aEnx
 r3esYTFLjF7pIVNT6H/rEpHFZ54DJGjpcbLEyfZUPA+BN8Xz3OgBZHqMqbmbKfT97seJHSaqJsX
 nULwngkC23oe5MUUjOVLjpcv3+aVWqnGP8cwskh2ykchnGVxzrpJ3wOcjREe582ZEiMakVS3X24
 M2I/iHbz6oxwENRH9/IhGf8jpo1SXMsIanV2f8qBUVUnbA68pQXeVOeUGCGdQp9/VXkk4IMVa3C
 R2JCZ6NqRMgvQPfxH4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX8mzSSkV/JDML
 /xjPcb51iOYmtmGEx6EWKK/ZhRoVgroqh/yvJJrt2bnt9Ye32DatEGzArSr7y8Ou3qvbDASpZBE
 JrBEgmLjdiiCoK2IBsy1z6GoTREcEaM=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f2d1d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sL3OggO7JJQHRSF82XrJugT2yGBUB4Jd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210087

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 5abc23b9b676..c5a772b05223 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -484,6 +484,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 

-- 
2.54.0

