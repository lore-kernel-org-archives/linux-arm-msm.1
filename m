Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B477946F4BE
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937489; cv=none; b=Zo1DsLWxmq3dpRz64PIlfh5tAhInf+5ysH2la4ZxxfVwEAIXcJUbXFWwUVBh/Arn2ijGsTiozenay9BwdHC375FU8GiUnzVnCtmbvdMAxoTYNgYwoQkaDYgDGigh/2p1yLQuEceWWQXa985onTyZn528Iww2HJ6Kij2G7aMLlRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937489; c=relaxed/simple;
	bh=hrP5rTHxzMAfNHmLsJGTCWdjS1eSDth9PH20iZTDVCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbPCU/seuyu+uqtrGO47ikY8Rd6Jc8Fyw1BBB4/nyD/SnqkAFTYE6YW7LDA1INcP7kqEMtuEXiIRgMHWzUVu7H84i4dTbvQ1WaWPUoj76y7OwxbUmqPque6SJYGIkgIoXJR9SmHVQ7pb5hAFBWNWAjl7J0gX6aQIP9DaizMX2wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSG56gU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKTNWesA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSG56gU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKTNWesA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHIce3314059
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 13:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mpsp8/7DeRTmhUckVHrI0J2YGgdsGZzf7I8
	IqJ5gQ6c=; b=PSG56gU+aa9MYZaULxO/R4B2aX4/ljnKByt2ZRFbMVoGwX6Ufrx
	Zdm28NZtfZrTb+LVUkzg4nL2+1NMEi7W/DFaM4q9IVsZ4pKeboAqyXPqxKf8YVPM
	MnHw2SFFqAP8F1H/i+EY0l+uz38rSSdpTwKQUgJaiVf8BFZRyb9pSjC85ivGiauD
	hLjAXEMhAVyyhMwsRYY3hFL7OwNpEh4uHGurOcRGRuhEvLmonZdnkud5TLrxxilT
	9DmCKaNJzMAzKMwBi4WTh2jtAZlgP7zs0YyIKikcLyWDka9SCkzSFFnirulbdVnv
	tuOgs2xHUQG0c+kWtMVizXQOZtHeXqOjLLA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5r3tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 13:44:45 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81aea53d559so19040117b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937485; x=1786542285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpsp8/7DeRTmhUckVHrI0J2YGgdsGZzf7I8IqJ5gQ6c=;
        b=HKTNWesARGierjB5hH65h5fRCBpR0Us1ExVgaR8LbOrUqdUkl7id5JO10jD1NLOIWW
         CPyztilr+3TT3lQapmCxsbm41KZLRxgaDoPEPoErcqOBgU+IHLlTzsOXyLNl8nRugF4n
         40KW8+E9GisE7vJpAxNtvxKKwImPECv89axlJZqWWyAQmHFkFo03kLlgF0AfhAw4UmjC
         giiy6mae6UYAeab3laAqtZj/G6pr0f3nAb1YhgwlbFFgHW6rV1PlvHul7NiobBfiTa8x
         WUPnV1PnW4x/ogtv7cpqKtYatrzVjhDvL/SWD4NbK3GgCFNXqYU06uTR146FFPWdZo4U
         SrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937485; x=1786542285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpsp8/7DeRTmhUckVHrI0J2YGgdsGZzf7I8IqJ5gQ6c=;
        b=BgMHn5L6J5lCXq4Ti/GaVYYGfGAW6eAOKPG+k9KwpHyfK3eJgwrwkQ1nUSzfa02262
         hTvqAsjhGkyhVQgt0b6K27jmCCN9JhmHhb+ywrS8UTL3EFzKL7pzoOk0bvbsuiNcHDXv
         VBZ13xG6RQeE8hfkTnkY+DeXEMWySt9vciLOd/rhkZjStIdf9Wiv/aelu+i7qYsMZOKs
         ACEOYh2YjuxuBiyicnfJgpBq0zoI+Gy0rmWHBksJT16Kb2AmtbYIFVb3r5QtSQh1Iepi
         EQHDQnhVEwWj8fCYSedcQdh1Jb4S+z8G7kI+3cbrmHU9FWCwNG/KYMPh8U+T6Jm6MLv9
         43RQ==
X-Gm-Message-State: AOJu0YypUsRyy5sRKJ5IbqWNaz2n8kvzx+cRIkhRgVp1AsQgbe4tdPwp
	e5Y2HFUbOcQ/T+lfEyLrAmmKS7LzPGitDsTUsZb5uMQ39mIMfQJkQPgNG8twy7TpJNM5vrieiNB
	yDHVBDoDj8ab7z3Gxt7+Cw9ne/Z0Zqiz7Un+3hhHRVR495sws7CQtcRWZlqloUykNrA38
X-Gm-Gg: AR+sD136JAZNoFa4I7MeyHwNxUJO0sKiWoW/KekUl7l8jWvOpr2NHtU5XZZB9I9HxUB
	WVk6ijbVf00pTStkZtVmM54zSyMbXXimoM5rR/Q62WD2duQNCiMWk7RUkRYMZp2RBHUvgdj1Rzn
	J73ayMr53lcQnvCqejdi97RvET3UDLaGTN33RJq7BaNqj9b2ZzaxgSvEcHbUG4MA+OA2y3RVRap
	2UA2rsuasDPe5OUfFdPK23sS3ZDKXmaswDBd6//0dSkf+mjKMs3aW0KWXN3PA69nDrGNDhZlrXF
	tOwwG+HeKQXM8/ov5zKD4NOXlT72s8MjIfF24VgdYAKk5VoU4vRysCnYFr2O83tsQTkyb3Ime+Z
	KJG2MeAP6tZSfZvk+k+bhDuTUcr4=
X-Received: by 2002:a05:690c:6ac2:b0:809:6b62:2f7a with SMTP id 00721157ae682-82022348e0dmr39710657b3.21.1785937485035;
        Wed, 05 Aug 2026 06:44:45 -0700 (PDT)
X-Received: by 2002:a05:690c:6ac2:b0:809:6b62:2f7a with SMTP id 00721157ae682-82022348e0dmr39710187b3.21.1785937484507;
        Wed, 05 Aug 2026 06:44:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201341d3bcsm20647057b3.24.2026.08.05.06.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:44:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
Date: Wed,  5 Aug 2026 19:14:36 +0530
Message-ID: <20260805134436.2817251-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xea5Co55 c=1 sm=1 tr=0 ts=6a733e4d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TzvV3HYDIdy8bbtRLkAA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: _xB5qWCGUYBlff7FchFrbOeKvLp_ISxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX46I9DB5h90iL
 2lxRtwtu0Nng6MBLxs82o3/UJKF8v8ajJf3ym7lr9cClrLB4rZU7LJBM/QCqa9yM68dY1MHhyfu
 cPxOE/6MCIUcWN5Z0d3pSB5Ev3lgG6RmIxIJ+1xePI1FkyyS6AgUL6zay/Z2El56+6nRwqtJA4N
 xOwMtIIq/huTjffm/21lcklMfeo+LIVizdpgNFBjkxJqRaBc++nUBB29Lox+5BqRVCZ5A/W4cNc
 k5lBaKrhOPHVbFWRfs8iDjugZinrp1ETNeOoOeaBOstUgBp8LoWgY7eJlkIn4EUrxQFaAGyEDj2
 uK4IRAmwHqg6nqBkXL3w/odEJdz37J6Ev5/G+EsQBiY4sdjX4WovsedGiFfj+c707i2ywzeygOF
 p+odIuaO0jrNm+EHTmksTF1cEKw/jGHpMMNkAubvU/BriuhuNME1KQPEYoSE4dvH5Nujt40b+aa
 eWYNJoybL05BH9/s6TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX/cfwu8XeQu+G
 tYCVSNZhRaW9LQaf019om1oAlFuvHTw8n4YAbunD6gGhV9LVEcZUxrD5R6Kd4OktKerxUG71Ia7
 luGu7YVSSpKs5RUABaRpNTmy6gWW1rQ=
X-Proofpoint-ORIG-GUID: _xB5qWCGUYBlff7FchFrbOeKvLp_ISxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050111

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v5:
 - Separate patch, as other patches in the series got merged.
 - Resolved conflict.
 - Rebased it next-20260731.
 - Link to v4: https://lore.kernel.org/lkml/20260624190830.3131112-13-mukesh.ojha@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 075985ad7995..44d33f1bb0fb 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -701,6 +701,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7154,6 +7155,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3000 {
 				reg = <0x3000 0x2000>;
 			};
-- 
2.53.0

