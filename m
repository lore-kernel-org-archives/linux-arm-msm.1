Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600948;
	b=s/vHRPCEN014CdfjTMx3HT7WhbBAeh11ZnAjSwyMymmJ6w8y11jxVc0D2ChEJqOGyQGF
	 QZXcVI3iszzSReSx9RELxhyPWHCDZjyKFGUp4+tqx7n22ImeZZW16RZpzM9ndDwlyptJP
	 AGw12A6iwS/wLGjsrPQjg7mJwxFAAVAcwmNcB3pqmlDO5XFJIOCxbtwk0RB0tmF3M/lnA
	 4ZEf78oa8Ld/qKpi2ndzX51nDGeiaG6vBcyr0iY24gZMcZC4k+E7hi1LhbYoSh1Pv9IeW
	 lOGEq3tdbF+ELn/9k4Zy4veSpJTCI5Xs0pOCWdL7mwzfcCL4qFdD5HYjoybRUw5hR1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FFdL4Ia0dJSqJFQurPs7BvTO6zqp/840DW1bOoMT5X4=;
	b=2QAMRGrPx8zpNhmFlBjAVLCg8DrwnXKb+vCq4zU/vADYUHKGfFjZBoQbabK9WZrN1JGt
	 9pTLVVIf2BEcjG/oTFAM9BL07xDaDc21Zoq8n1vcL2dFUun0kLoASPWuwiBTBxQw2TR3P
	 JdvosW91qBGbrvj/qObUQcK0N8Fm6DVzNKCwuqpb2NMHL553TghOGNU9Sdo3RE8kj/6sF
	 u2r4jFaqh26pufGEPB+b546WrSj3f1sqIFetrg9mcAsZCQxBWk9QqRPheYRJr4WocoyI3
	 vdWXPXiOeSAytL4eWDa9Sq30iRH9/Ws74IE/AWeLTeNIgleFhO9g5fJWBZDhS8aXCmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9kegcIV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbL+grm0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B99E606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B99E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9kegcIV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbL+grm0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mLmr555411
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FFdL4Ia0dJSqJFQurPs7Bv
	TO6zqp/840DW1bOoMT5X4=; b=f9kegcIVW/jGsm25Nzp/3JIvXYcZk98WwWm2TU
	v+P25i4W93od76tFRaT3mDoprDEGUSoJEq+/o2g0Ctf6+CJCy8TGJ5FAx6Idwksc
	zobIkUMG1ECs524nXtfUyw6RiQJzLfbDQcmzipgMv1SoWOKh6JcwHytFrszbvdUr
	5ItlZfeKHHbRHQoQQPjk2Orl7oKwtntvNsaICtWoZA9Wcb3/MT8YM6xy28D01p+j
	lFItgpZpqyEk1ypb2PQqcpcUOsaQCJNXJW0Hdl0WN/9YEdtGfAOtqARn8tLAdfav
	ba++o+3id2sFS+gNsZ6FUSSuddM3jHGiKhUUZpHNJYX6nndg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnr7rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b45655b428so4608559a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600946; x=1796205746; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FFdL4Ia0dJSqJFQurPs7BvTO6zqp/840DW1bOoMT5X4=;
        b=bbL+grm0aMvViXf1dK1TnngThOSUPN+kRvuihwzly2kEfajdgP/GzySq6g7aSjnYWg
         kyrr293ddofVpb/TaiTMJfvTJWvz8rTIl0P8PzuzfqQolQqbRVQ50JyKttHLn/MLvWqa
         QFXJuheJAUnD40PQXbRmCmvGcLvZFAce9U1ktY3jtHAR+Q5CDuEi67LVI9kNTennHj/o
         DZ/oHXKjn4Pgs6fC54dnBAmFY1kC/kJqPLY5DLKK2mo6ILRkYz4g0H9lEynPBpeVgQCs
         ETNmrpr9a+qOG0ND6VUcj/ydXVPjmJJ9o0sxIXYNB9bO5cH+MOdZ/WXNXnkNINfY+nSc
         MFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600946; x=1796205746;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FFdL4Ia0dJSqJFQurPs7BvTO6zqp/840DW1bOoMT5X4=;
        b=mDUqyZQoqqukBos/Z++LCuSONlXEfNK5tuisDEafajVr/wjP2DSatS4IhZkiUjt/kg
         RIIfWRLXDpr+903CFylBb9SzDeu0G32jqxb7xhT5iTNep0TQ17/llD/Pqy5DPBvGYvJQ
         UMbjajk7GZZ2STAOcgrsswbFxtNZWSFPRRpAv47dbV/kevQJ7Zb6wE033N6mzuW5yecD
         8yu4sKcmD1lFt0Chz930f+4n8Qyg2KmcZ5X5QSpnLehJU8evLJd1a260yxzGyusRbRy1
         Gn6dO4QFQ2wmZ7X+aSN4dq6OllduAgXhgmAPJhkr8Sj6jHHoxKxs9j9mCUkxPyjSHGi2
         T29Q==
X-Gm-Message-State: APuU4Z+lTExSHvAS055iGW9seH5gBF9aPq4Me+ksYsBD3LtYQFHwT6rK
	iamJ0MTknlZ7zVogsWdsXwUtcN7nxucXIeLvpncaAkm3gE1MriahQc1jCy0laPBPC8QPzwiW282
	wFwN8yuCR/r7yUmTmuikpzeRBlTrdBR5pMo/v/zC1cpcY7hkmClZ14nSWMAHYEi/LviaK
X-Gm-Gg: AZFdTZe9uycDnSQQ+EBrQ9hTiA90s6BQNoo+dSZuPLQ1rVsmLGQXAFwJ0+PWEYuSyKY
	ZF1P9/ywdPtEPZl7QW/IUrzd+O1PCOav+1fIiHcC6waqyZrAqV1OhXl+yX1lxv9v4b0CKEdvhoq
	CHqPhBbHAIRp1/WsSNmldXUlbJTS+EqoNvDKe+387GjJe+zZ0XB/XzOyJln5hieB6C0uky/baPo
	LjHsXRuBc2V9DubqmJ0Od1u0F7O+RXuaLVU0usy2vS9ZHWNtAVTq6n4/Sn6hH3/Djaxc/RJhkXS
	iTK72wwW5wxdvKXda2Hc8xuD40AdjrBSddJ2clQWzjE7g9KSWUV6oL9aGpgi75mmtAi/g46wMwR
	IarMxJPjQPlLfm0ZdXiYP8eg0UcOpth4dy1tPATyL+OKWI1tA7MaZi7D04gkn+RtHHv0uCieEqR
	lT8y0zZrtc2GkMY/DYsNbBcn3O7XNsaPVJhMzZKSJHtg==
X-Received: by 2002:a17:90b:3a45:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b41c8528f4mr16809005a91.7.1795600946269;
        Wed, 25 Nov 2026 02:02:26 -0800 (PST)
X-Received: by 2002:a17:90b:3a45:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b41c8528f4mr16808929a91.7.1795600945173;
        Wed, 25 Nov 2026 02:02:25 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm29610915a91.16.2026.11.25.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:02:24 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Enable WCN7850 on Maili MTP
Date: Wed, 25 Nov 2026 18:02:08 +0800
Message-Id: <20261125-wlan-bt-v2-0-3ee862fec57a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACGyBmsC/z2P3W7DIAyFXyXielT8NEB7tfeYemGoWZha0gLJO
 lV590HS7cbSsY+/Yz9JxhQwk2P3JAnnkMMYqxBvHXEDxE+k4Vw1EUwozoSk3xeI1BbaCw+orJP
 GA6nuW0IfHivp47TpPNkvdKWtN4eFjNQmiG5orT9QNSa8ZxrxUegaw7l+EetgqieVDbsR3Hi9h
 nLstPPW64NTyimJhmmEfS/AetbvFSqvzspICYq0a4aQy5h+1jdnvsJeUeb/o5lTRrmxllvWH4D
 r9zHn3X2CS4vc1UJOy7L8AijiovIzAQAA
X-Change-ID: 20261023-wlan-bt-52fae6bc38fa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795600941; l=882;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=3JagGLN2zo0qxqcvn+w/8I3OJ+4hUMFx7TN6MDAE6dQ=;
 b=JSJLKaSZBmKyT4F6H7Z9cl9bn4zoI/AUHyPS5Oo5LuxPyEfEkLfTRxDOg9M/JITLsZkXHqIek
 gYQyqy7RlppCJm/XcTGzcEvak5mCBy8ez7dSDABO5kFXgopW3fEnIG8
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX+aZq4L6MlovK
 aPgWVEDPlm4uEvuU2lUCN5ODkB22sKkliRNJc12i3tk8hNyBl3r9zg0yImin0aAzmUQeo6xoDtv
 58dk66qsqS1BULDcZazi9DK3RylIdYxPTmsQMMzXrw91+7bMwjPUNt9m1NQtqXliD3AXFBTzDNK
 hbtGiYtt2vHvp+d9ZTylgDmcjdkNIRYB8rWA1T2i08xUXbmxulDSpZc/jUlDbLfcZgUnUMoMszx
 fheisNoryoxgBsHrkMyX/oyL+Gx6ViF4eKkmhgoT6yJ7aa1bZpqarARIpRr/sVzRA+BAJ6ikC/z
 r+Iict59YDMLc2Bdy02HAwi1ETFvYJI52MAgOy+WIBar5uO8Nsk82rjvJxwt8gdmJ8TK1NjnwOg
 o/LaTh1leb9yu2G1lwYDjQmZQFGe8w4WxC5Ldxs4gdiI+LTtXIPMXzGuJ3jjVWFTB021FlAmnKd
 pSIHBmtXc2uD8Tx5XZg==
X-Proofpoint-ORIG-GUID: wcY9YXarrRCFla39iWBOq8Zqas9YC6-L
X-Proofpoint-GUID: wcY9YXarrRCFla39iWBOq8Zqas9YC6-L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX9vSmxXsRVNJy
 9xY2Q9TMAGoswpGhH0S71f+kZjWewcwWejEykhz5KwbG+NulcWtwnGAGa25rW8APLC+aq2e9Hr6
 O5r8K2/4w/Q25/sXEAnX7ik5wnpmwbE=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b233 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=hXh6KkJ9KS8hL0CtB4cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

Enable WLAN and Bluetooth support for the WCN7850 on the Maili MTP
reworked with the Hamilton module.

Patch 1 describes the shared PMU and PCIe WLAN function. Patch 2 adds
the Bluetooth enable resources and UART connection.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v2:
- Reordered DT nodes per review comments.
- Link to v1: https://patch.msgid.link/20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com

---
Yijie Yang (2):
      arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
      arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth support

 arch/arm64/boot/dts/qcom/maili-mtp.dts | 121 +++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261023-wlan-bt-52fae6bc38fa

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

