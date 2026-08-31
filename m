Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B2391E76
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195446; cv=none; b=i8G1lsvEDmasuaIDa/lzNf0QDpg6qEz2rI7WVXx0lD/zWwtOQgJyq3VSFLDyx9cFeWAkRWtktQ6Pt0kee0QGKZ0CdhM/Z80jm7C0UzVUpE6TZ9S6l3jsqNRHI2K5K3wsSdxQ8YLtZM5Tsz491TWUB5e0lwXGJPlaMdvUBTn8EzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195446; c=relaxed/simple;
	bh=oELWqkmwsoza6haH/PioIO4100T5ZawOEUyQYNHAfK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FloEQsI4VD6+ru6NjtE/iVKq+qSRVuchDMFP8ZgBAGMo2U18swtVF66mIL2HMPbKRa90SSyRsh55Eylzi7VX1zVn+kJsYD62hAfRlp0mfrgvf31ihziYoFQ3BCfMvwIA1nAag13bef5WqcegA7KPbfEp2VqtMRQXEdd+W0sPuUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+rW9QHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeKfJRxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+rW9QHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeKfJRxu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFqHdO306148
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xzdw4ANgdb0JZMmtXD2iK8ZBkWdE2x0Je1CrCtG6Ms=; b=Z+rW9QHYKimjcI3V
	oO/CpTKIqA0Ig/hruD5f8t4j6U6+JESdoyizgIF41ZpFUxnTYpL7M27udU6xIqRS
	C4pz3zJxycnMtmIftvkVN5WYks7sj3h6hpKvVXo8lZZ+CejOl/ESGvL3NEpPLG1L
	92mCMN7x5NjmumCQe0FF0fthCko8RoIF4yjNO2g2/3ouwUFv2ao0cVyGxXZalgpQ
	rinT5q/VGW1iK+sdXwx0nOtvIaBZrnHz4TfBfuA87PRSabwqO4z/azj3/z9rIr3D
	vUqPpJ41b3p1Ytg03isOCMsLg18RtqWXK23Bqfn/T7j28zzabJSyDhNXzugR+JEW
	J1eikw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pman43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so552490485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788195443; x=1788800243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xzdw4ANgdb0JZMmtXD2iK8ZBkWdE2x0Je1CrCtG6Ms=;
        b=QeKfJRxu7vZapOiEcXfa4oNa+X1xck1mvkDEYfbnRVXVM86zHLT3MGlVfv14eaatx4
         ku6FksmNds0jTtOHfg9VQdBf4o8B+SNEJwN2W6UosH6coA3IcN9bNEpKJrub+3ceup93
         Z93iMx8zKDz+tgz16dtuNobG023Cl8E8hOAHBm3upW68di8yrfQJ9SIRG4d5I1ujdGnQ
         WAQoFzSu/GRJTqBzT5Jc87ggpF23aiUGWkjfQU69OeGaYvaz7KZQBrqxR+LetcXNXioA
         t5jXBjoygTx23FSI7CLykJy41h+gPnWQLsAJr/yvS55Qttaox3CiKeN/g1ZWhJj2C+JN
         asag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195443; x=1788800243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xzdw4ANgdb0JZMmtXD2iK8ZBkWdE2x0Je1CrCtG6Ms=;
        b=R+gEcZc30bJJ9GGdmFHsMX1rWrmWstqC37ij7zmY9wWkBPwgHHx60O4fwOoRSvi5y1
         acAMdDE1X10hrWvDqyiqJaFLhrSoykvD5fU1j1m1q6+3W2OGgxKcS3hln28mlQ+j08kz
         xij9h+eOtz7iHBjMU40JVYfdntTxXNRWp0kyqeoz58vH0E787y5crPptDXj+WxwRlKfZ
         zGDPk5wI04E8WZOBY7+wJqyN8NpmBWrcf0/Wcvuc15R4giDj/ol62kuqFPISZNqq4YM+
         KqveMXFKZ/PIOv2ULujBOu9lh1H7fk2jT1W3XL7Umb+uxKk4LO4DgrbucocIA+wS6LR/
         be2w==
X-Gm-Message-State: AFuF++mfMJOmek4IDsKYgakBvoAfMeLi7kgIOdH9zo/kK13FgSX1XyNa
	OIt8zjfI/KAYSGdVLyZXSI5H/tzgCn5nDBzrvBqexXIGguW7shGA1yciDKlkt+DHU505USLQq+N
	pXAHXMeo7dXItOsw4hL5Umsx4pa3uvxF023vYx+UUS8mrtnZIVG7SKVzne764Al+76/Oi/JhF4F
	Ip
X-Gm-Gg: AR+sD10grM7jC1B1upbrYyiWdBD5tm4QtF5INNERbS0T94I4i3Zh30KhWvrZnm0IpwY
	Ymb8AB4/B+GZYAYn/ew/09MgyEAYmQWDY9Q+03wMiKNb6V2oW0reUgmDZptHxVH2SapZQKto8Xi
	ztKJ2xlfELSYyDUJQDD1kvhAbayHSX0JnizEprZbGNWB/26YfpEqq+Xp/Ek48n+FJ6D07oZDRhx
	TrNtfnD6CJhOHoqhGn4uGVMdErrHohZ57XUov1WMCKaBXfDB1koeiwwNufkvqfS4HtMYQZy49qg
	4hqLT6xFpQZ8vIa8z1crrbLcJUB3rtqp2VWrxoNCNPbBv7OOclFcCc14iULbIxdbYD1PKBJZogV
	TRCX6bA==
X-Received: by 2002:a05:620a:1a13:b0:939:2d94:667c with SMTP id af79cd13be357-93948103974mr353626485a.21.1788195443088;
        Mon, 31 Aug 2026 09:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:939:2d94:667c with SMTP id af79cd13be357-93948103974mr353620485a.21.1788195442540;
        Mon, 31 Aug 2026 09:57:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm248426785e9.1.2026.08.31.09.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:57:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:57:12 +0300
Subject: [PATCH v5 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-eliza-add-cdsp-v5-2-dda8af2d2920@oss.qualcomm.com>
References: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oELWqkmwsoza6haH/PioIO4100T5ZawOEUyQYNHAfK0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlbJq5T6qAv8D7olq/gmlWPFW/Y1nVREp7jVwZ
 srLcGvsWkmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapWyagAKCRAbX0TJAJUV
 Vo6vEACCLDSwEn7cA+QkfxJohXWCArq4F5Nfeyf7J10KGsN6zlpU9ImQerjngAAzJVP+pE8nVIW
 ZEfrZToG1iNqEaZvOEyBSDMoxA+oDJexPKlibGASRwfuWY9rlMDnq70nB/AYcV0i37qsnPveqqD
 qNyRPEWoIP2EJPe6I9+yAWuVTit7HZuRBIxH4CVywtQ5L50avzc4a1ryT5d+rqvtd/sJmNn+OLs
 JcU9f763vTiMJMRAV2J/05vm6oHIcFo7lblWijjUrXHywPMUBQIs/GtEV8b5nrWHidSANpnJCpG
 i1oniipq+MLsugf9IGlPVTP+Gb+sETPT4Wnq8ODDdUbNDG/EN6sWaIlSaLh3dKpdJtGhqwINzae
 UZKa5/dVIB5puJe5AqWeujcA6U6QUd5Y8gBmlx7F8I2+Bz7mSEjdyeEqcFUv7b7Chon8kZSvelM
 fVRuSzYTNaP1aBCVECXB5YKVnIPNhDgBzCVmejy35aG5OCaohk/QTkhrRocUQHnx/eY91gzs7RB
 q6ms8yO3sXASPUmbSaeM7oxtpxLyBnHeMgTSGU3otoLsG0B1qNvAXhVYOVlIOvSBZUw5RKSFIh3
 StF9c+N4FzmYH+nUr1prdSWiS2rpC+JvTp6QS+aC076TG0dMSbQZqaRnfyGQewDoyrcUCklpKt2
 QDtN/nsdUdhmrjw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: obaslD2MJ4FloMwAwChVJzNWs1_JibCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfX/Xk2DBJIZszy
 ofVzKkfp3bR69a2fDUxTlq+on6iWi/Pf+O37qoBu/YpHSoLId1PrQMFFmwNdo3qM1Rc4qcXDvPI
 0Qmqx5H5R09oTkxog+AYhi8taKXy4dAY1XPWEp2cM34ZOIoagDsinA0NxMC/oP9u1s1CmN2kf63
 WX5JV+wwFfAqVaObS6Ru8UH5R+JPjhLgb8ocAI++qeaeWNTaKkTTRTwkLpF1g3i6ZfSRiaicM8N
 2xkJegY/haVVCxvSTYrKSkbcvcoFNtwJ4Z8ml2Fxr00DiQBNlM7W81Z5tD+EQ55FUAXfxsWXhxJ
 sZwI0Sm1J29tFL28rlZE3YXgK0kfo+OCyq6riYngTz6m3yC37XvMT05d92/w2ZuOK9y8Lwcj2wK
 HC+JFcvReB8BaoEVTNd3Xv+MuSsc9upY9dr8jW8kbDm2fPM05Fa1hiOmlOOt4kWhMc5egpafWWV
 ubBkXQuncq5OAKrdCvQ==
X-Proofpoint-GUID: obaslD2MJ4FloMwAwChVJzNWs1_JibCI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfXzzNI7MmwJjlv
 pE7JXfRPowzO47IjnTRcZvW87LEv9hEqdgrgsQRc2GhuX5nH8aeRI5pwyQnKxU6+xIjbYlKnYnv
 nGCQdGYTEPZeDO9B2Dplndfq2ciqRY8=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a95b274 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310146

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 868ae6c34830..3fc9aa3be463 100644
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

