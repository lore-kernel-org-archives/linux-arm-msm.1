Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792890589;
	b=2y+GFXkrcocEfQkPQnachqtYNkWI1NtF8zTxM+6hnYHwL3MFzeqYGnnRVfnUEXDjwYf0
	 X3MgS2xzy34Qr2vx6mCHG6hZHcQD5CLQGG+7DW//9vuoz/FHu+heTEjIw2irJoj71iJcd
	 iVRraqjRFpwcfirVsS1LSlamxKvykjFA7Z9J9PotU/cjPcasnKlXAERcSbtPfaKQDrL+i
	 K1Tkksz2Eax8JZT4SAqgNkSdRyH/Aoy5kkA8pdBXURmFmg5pSX9Lh1RBCwyYo6JJynZX3
	 lStRh8SdK6xi4aeyg6jMFfAlPa8ERi4iiqrmGsLsZwI9e47fe9QePbq+bGZfaids0AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792890589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i0AwH57X1vsjWKq5fcOf8sV7EOFwtM7v+VTGA+PEix0=;
	b=KPMvrwxNa+pxT747LX9Nsr7ooBVupJBZRvtpWMfsuKhl5IZy8RCUuAQEMUGJWIqnD3e1
	 wqu9lh5DKCT4mV+ioCJ6MJmbRs9gPXthob3H6MhtwzoZck/OwTdz1ARYioTqcC8EuCFvJ
	 WCOk8G9OqmBFjrwtOZBKZhlsVwBnHTO7OCzgYwPJfKczNdE8oDwPsUR0X/hzyg6iCySdV
	 TvE7hkZT0rqfhy1J2yu3fsMAl47lTQvvhMAnnnSwp2X0CH/gHQSinmy4QQcY+NuGzcphx
	 5q7xGcT6ijCyS7EJHcp3zKETBk+egUgcZnZ2nWR/GrMEc08JwYPSm4gy4L0XTQpQDng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGtUbw2y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gIBrV5CJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F93C606A31B
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 01:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F93C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGtUbw2y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gIBrV5CJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17HR43097777
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 01:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i0AwH57X1vsjWKq5fcOf8s
	V7EOFwtM7v+VTGA+PEix0=; b=QGtUbw2yK1pVFAsoGD4U9LzWjD0BnmL3TQMIpp
	NAXom6pW3HzUNaqsSJBwJk9PC29G5/e1ELJ7gjyMnZf6ZBEUxnDXutYoYDBXzY9Z
	edjHqm9CN/AUFi9k1Cuhk4cYuDLpPJxavvE3kEGGmF8IGSkPmvgTu0cmpayniElI
	ghrG1dsRi2FcbXV1f9KQMqKmyxaSDuzbu7c5N+OfKRdHL6EIaLFAWK+OeeNxoV7v
	IttQKFdb+aJ9aWFutZGCkQJOF8gQLndsEXMMWYkRhGkmtQliLqEEEND0G1qfnCoQ
	ooedrZNEUknWSryjzjSGhbkWCic1d7/nRXM/EvMjPcclg6gA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1pagag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 01:09:47 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677deb12bceso3403756d50.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 18:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792890587; x=1793495387; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i0AwH57X1vsjWKq5fcOf8sV7EOFwtM7v+VTGA+PEix0=;
        b=gIBrV5CJcyN563rzh+tOsnN930dET4phKmPbSeukGxvKogVQgn0nLzLIwSjF9FbSUO
         Dq+2wSwgXjlhNsKuOSrL/+/Sl7Q4zukPTsCw8+joNntyLfWRhpLMrJpqkd2+jrvj4ezy
         PvGwlsqX0619AUL/XXaA5PEpQqWbfJlhlu7SnEyZWkMQ8VdKo+4sxbSjiruuvflRL+oV
         KfXSWDMp4MLC8SfLW2mOpXKC83sBLrbtPyQFpuxbYjR3tHKLAuHVl3fTLWKPiTW0muRP
         xRpeaItCkl+3ZCgeTDY28j5j8tapsN8KjVIxaLastGfpiXnYx5zqqjManT0Zos8cYUky
         Cehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792890587; x=1793495387;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i0AwH57X1vsjWKq5fcOf8sV7EOFwtM7v+VTGA+PEix0=;
        b=mWoc+1kCgu/5t1p99/IdPfmhUy/v8KguTbKfBPnojIPLrvw9uUO/yo8MMiqNBRFnF6
         3f2eMm0WBetPKYn4McWGlYcfbBOnvoku3sm8Vyw1xbB/rXj0Xxx98sGRpc2oJOYTBvsp
         lMcmL3CpyDTut9TjHF8Bne0YeN8bhbWJVQnFaVjkk0wdRBFQO9qg7PkkAJ6CCDzEQsIn
         lSwAG50hoTdpVvkiZWit7Vqc1imeO9oIT3q28jn5u3kv2S/Wm2KbQQ7DW426Nm5BJPMw
         bldrBmfiHBxVqNItemG9JrjaH8ACSzKSjiN48u1RS0UsuSeoOlz1ujHugE9MOescgwT0
         kGew==
X-Gm-Message-State: AFq9FYInw2Hi9suxAcZvZBwQmS1uNF8YKptLQ11AMxygT/TREZJDrrTi
	DqQrn/Nt5Sf3d1o/jtHqi9Nc4tclpI++JqCZBaHVGz2ylGRY2w/2k5gIINPWV6TNicdLmqyq1rZ
	Psvd1OGK93X5NX9fOEAXEDkTt0Ce6UogErnXG4QsTwtdsV1d4osJ0AAVadix8DJp/3mrL
X-Gm-Gg: AYBFou0RiMAT+lpGTP1gOh7HMy/l/LrpntLmNJ+wXoxorF3wmbCzzk+g9R3kuml3cZh
	yOLIpv+d99kOaaRQscFv59bIjootpRAaPqZ/YpPH4Xw3J10eNM9eLUYfBlOKvhqlcSP6Wl0ImIb
	/5T87tAXenyFmoJ9Bkjcbb3OgJlbUAXe15YDu9D4uf1D0DA9E/JaV9uNRY6kWoqB1AVPeOj/p/a
	8tHTLWjvk1VXxZp910zU5mTah5fpUXDKdpGTsYNryPcAqkfbzO7iJVUmWqMlN7kIvNUk6/VyMUz
	OGQGJwp7PJpfAGlbS1xFUhkqCfJjzzi9cNJlIVSInNWSDwJfMkGJMQrR3ziIIPMsRy3qNmkWK+m
	MR/ruBARL++4bp77omzQ0CglY62qIsLEKdxpZrgwCpoOny7Rg3xyf3cpLCwWFS+LhMSAnsWU=
X-Received: by 2002:a05:690e:b84:b0:679:a56c:e2d4 with SMTP id 956f58d0204a3-67a4525b99cmr1612674d50.21.1792890586863;
        Sat, 24 Oct 2026 18:09:46 -0700 (PDT)
X-Received: by 2002:a05:690e:b84:b0:679:a56c:e2d4 with SMTP id 956f58d0204a3-67a4525b99cmr1612653d50.21.1792890586313;
        Sat, 24 Oct 2026 18:09:46 -0700 (PDT)
Received: from x2e.localdomain (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4626fb03sm1517286d50.17.2026.10.24.18.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 18:09:45 -0700 (PDT)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 21:09:44 -0400
Subject: [PATCH] arm64: dts: qcom: monaco: reserve firmware carve-outs
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANdW3WoC/yXMQQ6CMBBA0auQWTsJtFqMVzEs6jDVMbE1nYImh
 LtTcfkW/y+gnIUVLs0CmWdRSbGiOzRADx/vjDJWg2mN61pzxFeKnhKGD5LPM6epKFpn7cm70Ds
 6Qy3fmYN89+t1+Fun25Op/FawrhsiN8QYdwAAAA==
X-Change-ID: 20261024-monaco-fw-carveouts-36335a6f76c8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAwNCBTYWx0ZWRfX8q1kn6A2DjiL
 X4woka35qzmidwGvdEd9nQX0prEVdzUVwuOGGHofjnAkEW/jEY4Qa1elSd+dSCGt4LS6qkpcPcp
 baJUmePkmMws09MnV7tQ8uUbiil5KXY=
X-Proofpoint-GUID: biHJZXVEcIFqDsA1PEQ8IyAuvX4hL_E9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAwNCBTYWx0ZWRfX1Y86HkVpvxUN
 YooYWKHvZ06fEBVDdsP8n6IZro6lUbmrKzMJhDRHdnJ1/iI9F/wiw7oi7vwm4bxsf0+5yTOT234
 0h+VDA5iALPZncsgXm9nKOFWyiji9yO6pFO1V9tToq0GUodFkOTtd+Doh05lrj7UO09XvSumqyb
 knwRYddxjUYNNDelGjeTpdaiDkHZzsvWKMMy/dNR2knZMIcy7AGa6bv2phAtTvVq8ieTTa8ui4k
 7cJMnBNzKR4S2jKTkRCccuNLj/I239SQoh2y4vj8WZD1vOMS3O/zYsZx+3D3Lkm1faD9dPw+bbr
 DjFv3JdmzjhBNL9EGPrRlqERIvrPlmP9qHoEnFeeLCf5+i+btS6WtUNRwq5DjsPM4TeY2hlK3NI
 PnyNs0MPMnro6+lFG8TuhYaAGbrldkFXkEYL/31Sb0T9eXJ6a0QImKzOEEt8IoehshCIKkMX8al
 2k3ddPHHR+YLNW9MTDQ==
X-Proofpoint-ORIG-GUID: biHJZXVEcIFqDsA1PEQ8IyAuvX4hL_E9
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6add56db cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pG-yhIzIu_fIu1UVJuAA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250004

monaco.dtsi does not reserve the DDR carve-outs used by firmware at
runtime.

The downstream UEFI hides these from the OS. U-Boot as the EFI firmware
[0] builds its memory map from the SMEM DDR banks, which do not list
them, so it hands them to Linux as RAM, and the first write to one of
those pages takes an SError.

Reserve them as no-map, at the base and size the QCS8300 boot binaries
use, as lemans.dtsi does.

Link: https://lore.kernel.org/r/20260928-monaco-ventuno-q-v2-0-0e046c8242be@oss.qualcomm.com [0]
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
Tested on the Arduino VENTUNO Q with U-Boot as the EFI firmware and
with the downstream UEFI, which already withholds these regions.
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c65..43e1954b563b9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -729,6 +729,11 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		sail_ss_mem: sail-ss-region@80000000 {
+			reg = <0x0 0x80000000 0x0 0x10000000>;
+			no-map;
+		};
+
 		aop_image_mem: aop-image-region@90800000 {
 			reg = <0x0 0x90800000 0x0 0x60000>;
 			no-map;
@@ -740,6 +745,11 @@ aop_cmd_db_mem: aop-cmd-db-region@90860000 {
 			no-map;
 		};
 
+		ddr_training_checksum_mem: ddr-training-checksum-region@908c0000 {
+			reg = <0x0 0x908c0000 0x0 0x1000>;
+			no-map;
+		};
+
 		smem_mem: smem@90900000 {
 			compatible = "qcom,smem";
 			reg = <0x0 0x90900000 0x0 0x200000>;
@@ -747,6 +757,21 @@ smem_mem: smem@90900000 {
 			hwlocks = <&tcsr_mutex 3>;
 		};
 
+		tz_sail_mailbox_mem: tz-sail-mailbox-region@90c00000 {
+			reg = <0x0 0x90c00000 0x0 0x100000>;
+			no-map;
+		};
+
+		sail_mailbox_mem: sail-mailbox-region@90d00000 {
+			reg = <0x0 0x90d00000 0x0 0x100000>;
+			no-map;
+		};
+
+		sail_ota_mem: sail-ota-region@90e00000 {
+			reg = <0x0 0x90e00000 0x0 0x300000>;
+			no-map;
+		};
+
 		gunyah_md_mem: gunyah-md-region@91a80000 {
 			reg = <0x0 0x91a80000 0x0 0x80000>;
 			no-map;
@@ -811,6 +836,36 @@ video_mem: video-region@9be82000 {
 			reg = <0x0 0x9be82000 0x0 0x700000>;
 			no-map;
 		};
+
+		tags_mem: tags-region@d0100000 {
+			reg = <0x0 0xd0100000 0x0 0x1200000>;
+			no-map;
+		};
+
+		qtee_mem: qtee-region@d1300000 {
+			reg = <0x0 0xd1300000 0x0 0x500000>;
+			no-map;
+		};
+
+		deepsleep_backup_mem: deepsleep-backup-region@d1800000 {
+			reg = <0x0 0xd1800000 0x0 0x100000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps-region@d1900000 {
+			reg = <0x0 0xd1900000 0x0 0x1a00000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat-region@db100000 {
+			reg = <0x0 0xdb100000 0x0 0x100000>;
+			no-map;
+		};
+
+		cpucp_fw_mem: cpucp-fw-region@db200000 {
+			reg = <0x0 0xdb200000 0x0 0x100000>;
+			no-map;
+		};
 	};
 
 	smp2p-adsp {

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261024-monaco-fw-carveouts-36335a6f76c8

Best regards,
--  
Tyler Baker <tyler.baker@oss.qualcomm.com>

