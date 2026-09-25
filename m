Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677B4746AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331220; cv=none; b=ZadT1AJvA3qe5ZV06B+sMJCraYRSCMmy2i0ijsMRYi/pDOnQwDFzWtXQYZ7QOdlgjlblHCY9RRuwPJ11TXxdtlPYx6Nd5H5Y2mlxWI0YXpS9QzWTVIfS0Kv/nUNl6Vk3yzR9igb3UCOI77KGUtKQG8V2TsQS9SoZv1MynpU02gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331220; c=relaxed/simple;
	bh=kj+B1T4aLCS/nzuyqzbwSZ3BJPr+Sze7VYEw9AAD2aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hm+zuylfEsuQN5xRsttTiVdbp3J3Lt1A4IKFFziTgptcKtmgwHBrDO27U8Z7Ztw3Lo/Y8J5RF9RBUjmoP41Kc+h3fIxnR/Xa6hcvfpJqajI/Jv1hblAwDqKbKDtfMfGTDdy6qoBXPCAC1FZOjPuutjr0ZkyXIowtPTFqURKJ38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4Y9CNY6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WezzNwS5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4Y9CNY6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WezzNwS5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YrIp3737124
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n3vTP1V3Fah
	npFShyDWIKuDXZUTyfor7i7UwWOsQnlk=; b=V4Y9CNY6MuvPz+Hi3QcZIeVd/J7
	Shpzx7ochWBMI9PvqUwlC06KoPwWxX4sc5kx6qPzqi3l6+A+YRACHZ/prURgv0z2
	o97mQS3y4XH4hKmApLwCjb6n86KhEjAul5piK404MBHcuWoMw0XY/uMZAApOszmO
	THSlvQwdelc3ZPyFaNGGltfXOpVvAJVhvUNTAxbuySQjI9zDMj/UMo4o86BuqWqb
	jA5HYTwRnyA3ZTb1jOGm+uizhy+q5QFpa9nj6Bm29pv5GoTx7fmmKMGA/Z3AIj9R
	vUGvxOLyO+dNGaQlymdsgR+E5fnJnYu4EhFyOGQnwY6jO7Arel7X5aQ1GsQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e3pp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341b0999491so935340eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331217; x=1790936017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3vTP1V3FahnpFShyDWIKuDXZUTyfor7i7UwWOsQnlk=;
        b=WezzNwS5foDL16vzgBwysCr4wMnJf4cm6QVEDncl2r1d3DmQHkcrlu4Mz47NxU5B9o
         ct4xTiu8zthLurfwcuYFRxyCTqif4u1IzHx5RBziSD/u6r9DQ0j4WMILkGGRpJVa+Kra
         CLfATG+QitOt2Z1r4PbPG10bILv5jiI2k6RdhxmM0IjLSOl1DUXqFFf+rdp7R1eUnxTy
         NwhY0uBWjEK7bTbbxP1Y+1plp0GZpSmR7EYpCocQCsZa4YqZxi2GUJYevUF+vAZUyWt6
         X5/yuMKbtnrwmwQ2wRo8oTZKHS16DMnA+xOphuZ6sV7olghhyVHhoQO9O7vD5V988mMl
         xkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331217; x=1790936017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3vTP1V3FahnpFShyDWIKuDXZUTyfor7i7UwWOsQnlk=;
        b=Get1E3geYLDTpVjgnOpNnGXkGw70jDzdcKembZQqIacv2jBb8oqTxdpZ7iyEHdshxC
         Vc5nkawOKfNOvaQvR3HzWIBQCEGRcMM+f7TpXdBcLGffx29hZWAE5qei0awGU/xn9p2n
         Xiw1EafP3yNoiaDkoFbf10Z4Z/6eNhBMyRT4SROPIfNl1mBo5XaWs/IxpBzLYEYIVR45
         AVdvp+0xnsT6WPmUBjTGI13McT4dm3L/MYVJiTZAbtYDaXqsIQPw48CdUk/4pDcmVd/k
         24Fyq85ti0l1WxQm5VAsAQHPT7j3jsE9oZ2so7yv/sxKDyT3k+jNBGcIfYE5bpvU7Rcv
         EmeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNDLpkB2BBzsOwE1Qq9Z0cQwzGaFuzCt3v/olfS2mN970Rjvhlu/AiRafQzcd3iem7L1cMcx1YihRVS0hb@vger.kernel.org
X-Gm-Message-State: AFuF++mhKdUBXr9p1J8+WEU29gGZYDlFwo3B7EPQ++mffcbCJA6fnKXI
	CCaIGi4fhIg/OBcGN5+auY5eiQILGYB+0aYUXfH0fPzI+Wxiykf9Qd13cpzDIAqO9KbSxpKhK+S
	NjA7Hn8EKZI01UCzkUSPKXyhkQNfopj73AC6rRl5+DF+FdvgYSIMYRWkCuiMoeCy9vjyB
X-Gm-Gg: AYBFou0sREmJBAl+k5ywGZm+b1JWcVFGpTnFI7EEhnrob13OLzZH5t1RF3wVWa4kd8D
	oAYzHjKZCKP3CL4WM8WCFVtnHEEt4VUiR/Egjzh/WTZsyaMqJV2x/H7iNXe8D/N4Q9KZPr4elsk
	dJCBlQDCRXe46Kx0Y38TNwjtORBdB0YLeKR43mlPQ4637t9A61jjsqSRtdMBHXJ3A7+eNnuPlA7
	kBtUiqNQIFMzwcQSFRAvSqyi5l9SQ4Jxel02SK/BzFUP8AsJDVa+zXDMXPRCqeBNKnRO+FdDSUv
	3g2IZWqm9sWeVjKeeYtCDJ7Enu7hYfFpnyBHackRbGN3kN/H4y2sIliIxY5xvuOqz8DJFRlbq4d
	m7jKDR2AevVxUKy1GAjjvlgO7kg==
X-Received: by 2002:a05:7022:108d:b0:143:7cca:e14 with SMTP id a92af1059eb24-14503f6a36emr3579058c88.12.1790331215401;
        Fri, 25 Sep 2026 03:13:35 -0700 (PDT)
X-Received: by 2002:a05:7022:108d:b0:143:7cca:e14 with SMTP id a92af1059eb24-14503f6a36emr3579000c88.12.1790331212990;
        Fri, 25 Sep 2026 03:13:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: hawi: Trivial fix
Date: Fri, 25 Sep 2026 15:43:08 +0530
Message-ID: <20260925101309.3826038-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX8fQn63S5QDCd
 TkMIOoG6H0202csDmfM1e4IzLQbG5U53nYFn7DWzJViPsY4ECBLzDL2QeuONEQSlECF7czXnYmm
 mUk8qSIT2Y408KCFtf2hX0zkwaoiT0C6BcKahtPH9boTMdyDlT/W3K6klnqv4Kd8K3OR9k7h75V
 t7YDkoTFofR7ZtkbWLgpLdIXBu5dlzV+yfSfD+j3UhbxxaduIy35ZRhJnYAv22Km13AVzQv7jIt
 jqzvk5xM8RLSXhv9ZI+frS73tVkKAAMBuo7l849PSx9pUIYt5jUI1jvhK2P8psDLDxJtx8vs71p
 dbYMgQF3OfGVh203ZJQaSAroVlypOLrNIJNz5mv3heh5Kd4WBBS/KD/U23Zg69zEYd4g36p3k5I
 +k4WLPsZLCP27+xEqEizVu2NIl/zpUCtOTnKEHMYPsVWXICkhGkEwH5j60QSc0rcigg7NRjZvuL
 7zjVrdNLDIV4WCywLCQ==
X-Proofpoint-GUID: MyiEwnSniP8jFLWHwHBw2cmV1GFTDIVx
X-Proofpoint-ORIG-GUID: MyiEwnSniP8jFLWHwHBw2cmV1GFTDIVx
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab64951 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Dodmwxs2qinD0bs0ztoA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX/UdgcoQbJqFO
 UtZzFa2zIeCSmumI9Dq4DRK24wa4Gtbbp/Hq8qIUArQFpCSkwgltCk5Hfqb7lt9vvtRJuDv+xN5
 RVtDpdoLHZG/NlmSA6aLN/Za5+6kXvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250040

A stray blank line sits between the sdhc2 OPP table closing brace and
the sdhc2 node closing brace in hawi.dtsi, and the pmic_glink_dp_out
endpoint in hawi-mtp.dts carries a commented-out remote-endpoint that
was never wired up, unlike the intentionally empty SBU endpoints for
now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 1 -
 arch/arm64/boot/dts/qcom/hawi.dtsi    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 88e0afa791b3..c38e5fab7a2c 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -120,7 +120,6 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_dp_out: endpoint {
-						//remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index d47440791479..6b0a0ff0faa4 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3295,7 +3295,6 @@ opp-202000000 {
 					required-opps = <&rpmhpd_opp_svs_l1>;
 				};
 			};
-
 		};
 
 		ufs_mem_phy: phy@1d80000 {
-- 
2.55.0

