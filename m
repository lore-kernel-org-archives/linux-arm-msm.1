Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577946;
	b=WeSz+DZYH/Y1DwriAjaV1ijxAfu3pTi6c7wAzMXTG2WmWyJtHp9vhislwHSiYRpzLZ7u
	 qZMcdFk6SerIljauAL+Ddri10E9+PxL1Y5OsFK7ASNt9Fy7yTEpCLXCH7537Wt5vJ6I2h
	 bT+DJAmrxEN8NtYeQcS9v0t+SMu2T/xXMVpyqh6oWL5Cvxf3FBhsgLyHHpg+TjOU1WLqe
	 0e9+nD+/cRK0ZlHy6gP38HXPn8ndpZfxDL+mbpRBbEUQr6E3mU74iKzzzyeOButNwZGNR
	 DhePTPL2X2ib3ltHeagDBfJdBGKBzZwXipgp/fcQsGDmsDbhEUqxsaJJUqm3F9MKcug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GA5PsUYzNPSJmIWORaGujdrfWR53/PknxcLDPZVXqzM=;
	b=ESxjwwqgtwYQTel5Xr0JlsIGOrG7KqH0yYbsGkyiPr73ye04RtFZ5OH4MdT7Xu8yxXQZ
	 l8AprJKl+VAG/W1KAHvIHtA/BZwU81Ht4A0BPCl38Me+tXXp/ERnWDfhZzNuwCC3wSe6p
	 G3Fepo5qcpN1FI5sQ6iWu6lK5La+g7U5AvRAbL2BOy1zTZwHx7Pn03mwCcT6z0nCn6DY7
	 Xn8EunsjQZwzdSsGmfdyQL4ttf2K+QEHhPylJoRGkSW4FKhBDOFI7U5kwrfaQgEB1JTLa
	 alDDzbt6TdJx44XGGijMjxN3qI2Eled7ylP1yJdtRx5vc/YgQXDRFHXZaP9LRUB2qfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PRlYutNM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRL4RI7w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D3A606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D3A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PRlYutNM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRL4RI7w
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5ovU3620578
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GA5PsUYzNPSJmIWORaGujd
	rfWR53/PknxcLDPZVXqzM=; b=PRlYutNMLyyGTLIESbgj/+mljAFtNdwo5XaiaX
	ZrCkr1WlW/pwC7olb5yukxSFPrObgvMVx4D40SmkZzlDSW2H9O37rDvaolcS/HPV
	h6yG2F4YkRoQrJ3mQjxSKnGc+k77knkrvAkHOfk4dyLzcwTdwpf5lQGKAu/A3fHT
	lG7jkHAMZ1oePF66qJGeMhxfUHeRkyI/6av/vdOABxs1dymuWEXrP7pH+htssyuO
	vzwl1py47nE0uCtQNqVs/S3QF80W0Rpm+tyFITlWLIs5keW25Y1EnUD6JJScvvRg
	uNSikRJxL7qjDy4FVFBqs+ud2Rwf/Xkcw2+QPTp+OoEbKf0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3uaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:19:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso300271885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577944; x=1793182744; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GA5PsUYzNPSJmIWORaGujdrfWR53/PknxcLDPZVXqzM=;
        b=WRL4RI7w0S6k9CDEMXu8VXYc1VEpKjSlqSik1eSNNpYMo5UpN/pQ9KHEEO7lagu1yV
         RIG2G7PyavEMSMww2bacXmUTWZEJsruqUVfipmgqgCfb4QUyEAxn00U44DuTTLJcgSli
         pdipNcOhCaHbeHjNDHpn+r7SedvhxNF3xEkX6ZUaKUubbOqb53kX2ndOF2SpgDqgDbku
         HG0gJ0mHKN8y23xFvaXaSbM9zCogD9BRENsji0ON0WmwGqWAXpqJJ18H63IzizZEt5zS
         UbkLZnYu4FKVCjbMA/Rtj5nSiK7Tzj3yafvJL8YyIjYQMRynv1KxyUzk+auwvcpMDJuo
         gPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577944; x=1793182744;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GA5PsUYzNPSJmIWORaGujdrfWR53/PknxcLDPZVXqzM=;
        b=gYD9BtVkgp8KUrYkz2lGQ4nTDYunbQMvo80kuyEt4jE/6ej1Pmo3Chsn9y03sIG/OW
         Tmuw055FJci6Yph6/KXXK78rk55Vll+HtFpQVOYPgHwCHufBEwUL7jatPP2iCD78KBJn
         5vZ4AyzcBtCJdGj/ugYBywsGkGcPaod8D0O3j4wSPJmqVSO083f1VBJajF5ORObqnWmg
         OtwQtcWtvvMe0yR95rEn2RPwk3DVUmKScekzwZiy7sWYqVweSWaHZkJt+MJ8mZX1x4M/
         ZRxd4q9k66FutN3uxpS9CVUvFMfpA1s+M+nlYB3CA29i6tyEAQUpYc8R2gC5oHe3YVXa
         XEzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH3Zese3szYRWVZ6L0NiSlPzy+OEMPqlEbeTGzLQk1x6Qz0oTvq4dO2wErMEVwUvbqPwxZ7rkdkrf0gATL@vger.kernel.org
X-Gm-Message-State: AFq9FYLwrSTU8eyTei69Iw0EvIlwzxB73yyAd5Py5VMZ++FCOAwF5RLZ
	zlJUXL01BXXn0thcR106uZW9rYUy85lS4+RDRuQrnztwtWjo6BTFGc4j/NubNmcrKgKtOmB9rOX
	QY55Qajn3BAG3Kl41mco4a0qFBFPE3glmKwxVcNzhQgq0pMaxnkF4HES431cWg0ZSyx1L
X-Gm-Gg: AYBFou0mggZsORpgAJiniw3xqNWpLqRRoOv0XJQZti/0Ff7e5Ymde/KmHISBRTyQoUY
	c6K3yhRC2JABTOhX96MFEK+EJol1RsewCnuU33DXoTUW5VemoTXbPaQMXpHC0gGz/Iga+KHx13i
	2TCAWRCH5/Mm/+iafTDF2bsmKVTuZEzC9KGOW+lj64g0IbHx6viz3bvm+HQsyyJoN+kqTe7wdt7
	3UUn3/z3h7b4DD8W/uOMQrt21XEvuvWlPYNs82NFVo9+eiZVFGhJ2vuC5ABg/7Sj380OYyL00AL
	Eh1xcM6VJbcnBnOSNaZZz5b1cI0jvKSzvAGPX8eEKzP/Reh1an3dXyuMbKZAuOhpi4z1248Y0m9
	cFOqJj/q/mw==
X-Received: by 2002:a05:620a:4554:b0:93e:c12d:4ec9 with SMTP id af79cd13be357-93f4c9a31e2mr737699685a.41.1792577943991;
        Wed, 21 Oct 2026 03:19:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:93e:c12d:4ec9 with SMTP id af79cd13be357-93f4c9a31e2mr737696685a.41.1792577943345;
        Wed, 21 Oct 2026 03:19:03 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm159267855e9.15.2026.10.21.03.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:19:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:18:52 +0300
Subject: [PATCH v4] arm64: dts: qcom: eliza: Add FastRPC support
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
Message-Id: <20261021-dts-qcom-eliza-add-fastrpc-v4-1-4d33839dbba5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIuR2GoC/43OSW7DMAwF0KsEWpeGBleRu+o9ii5kiWpUJHYsy
 kbSwHev7AbJptOGwCc+HnlhhCkisafNhSWcIsW+K6F+2DC3s90bQvQlM8ml5lspwGeCwfUHwH3
 8sGC9h2App6MDx402Fq1rXGAFOCYM8bTiL69fmcb2HV1exGsj4TCWq/le20XKfTqvL01i2f7r+
 iRAgGvRauMNctE+90TVMNp96R+qMtiiT/IuNkL/KsoiNo/ot7wOQWrzg6huouB/iKqINarQaiU
 V59/9OM/zJ0ybwt6WAQAA
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6164;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6UpmWzc7yaSMOx2F4l4aRKI6f/B121oR9MFHt3tcZRU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq2JGQvg1FtwWDWezErxhq8m8f6yGZQAym6RTTB
 bsyb4VUpP2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCatiRkAAKCRAbX0TJAJUV
 VhDDD/9DmADk0bRcB1Z+hDy3FWnojJ0/seRmyLfcAuzhtnmH5d7abTCBqYaY1AtYfFItlnKhCu3
 Nznxgkg0LkIDoMVKbf3fxLellv/xpBHSlF5cjTc26LEKn6TW7bmEXC1EnqbktAIOJw21XmqBlHY
 nRb4r2oSxmT02sln946W55zYOYukyRMTI2IovsdYEaF1QK/4kW/x3Vb78+k2yJzCbfqPfwAhyax
 cVlQnoNnpklsLBKhyEvUXc736gLhymeUD6h8xu4He90aMdEaafR1vpDIIjW90X6nAIE9sOdZ32y
 TABg/4OAxHtxXxReFpfMoX1t725H1DWIX3xTF9uXi0xivPOx68SHDlHGDtBezGA+tHWZ3oDBb4h
 ZYhY5j8kKvmOdCbOLOgVntvQdwKXJPUO0mgUHptEmVRr9ALGfHOmQQS6DZlxD9ot1RSFGUwfGNF
 BSl0RdSKScAmInNzsPtHaO6a7IAq8L6VuyFVAISmjTJEHww+nxqpa1WkVrhO6X3Y5Xg451izFVs
 OMie7WfVUR0t5HZNNfiA9fh1HjUTyeuTCncbg+1GE6lzVSt9KYCO0fVM/DJF/xnET2dV55Z/l7l
 EfILo1mYPHfobg2NEEipnl3MgTlE68KTfX7i7R6uGAATTgLosF+WKhjJpCEUU3HeScRsf24Tdj/
 V3j+lE4Pfas6zcg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXxOmcVxCrieyL
 wYVAXL2juMMCGOYugLr8MWDJGqlBH44GRhqYp1mcL6R4OEmI1bUd5dOX9Lh/QzII9HhZ0VRyJHs
 c6V2Mo5o8+9qyiYH6GhSIHUkbfNRFYyIhVRqgQvTyuyASExGS2GJ4VAa+QeLnEhhvP1n366DiCf
 Y8g2d/A9iF0VQi1sFbNe8MS+DHRYwrHEGIv3smWzp5cDaZZqrFKTnoKhIAySSzCdIh6RsQwe380
 ZYAIyNUoYlUFi706w0FpVJpkn/WI4bkDVmJSIjor5OrOFSSk9uY7aJvpbhTqKaLEmrFeWUVK0gJ
 zD3W5ZL6qvRaRvlJUyefUlbaxUe7W30Of75kmP3UgQbDfbgZ/E0ZzHTn2Hj9FDN01qLc395TL6c
 ZBt+5Ui61au/aF7Ysl9iotBSevs8+ZPp+jfcXsxwePcj4jgwnDfVm1gHDtsR0rvUwMEGIMzSRsj
 2V4PIhx5QM2QnQcE1Ug==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad89199 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iNmt55xwLDWB6Bi4V4cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: nLEpCVrUJQpPHHQj1dHS5Lyg2NSQpGD6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX4TJKAETUDLHd
 XUBLkWDGSSMQSfQtA5sMB05mFAotiok0g1ukZFEuJhH1xcdJQ75WLeooAHFYLn7Y3tby3UgWvsB
 KFYCGiesiKSsPNE81B681zMMi+LW5k8=
X-Proofpoint-GUID: nLEpCVrUJQpPHHQj1dHS5Lyg2NSQpGD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
the ADSP remote heap memory region needed by the Audio PD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Fix the off-by-one in the remote heap alloc-ranges size so that
  0xffffffff is also a valid address (Konrad).
- Link to v3: https://patch.msgid.link/20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com

Changes in v3:
- Rebase onto next-20261015.
- Add the ADSP remote heap memory region (no-map) and VMIDs.
- Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1067 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..93e922de53cb 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -615,6 +616,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x180000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x1 0x00000000>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			no-map;
+		};
 	};
 
 	smp2p-adsp {
@@ -2432,6 +2441,69 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4643,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

