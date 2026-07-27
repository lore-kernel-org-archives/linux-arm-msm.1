Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104BD432E72
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176969; cv=none; b=IQKrHBzKo0nsW0OYZnOp43kuw0oSRznzyCBJNFZWBoKvZavxgZyA5Q5Fs/xKPSx1DhKrWlqouWq3/VdrGBAsgFHNQLNodiVpeQOJhZEkZSmT2XYEaqU2peLKeBebiOLH5HZgdfqdVhtb9DQCcNZnJ9abYWPbSf77BFR7kt5rMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176969; c=relaxed/simple;
	bh=JwCLR9iFFFFuRnYMfZ24S/lkYDC1+Mq6uVmbgytz5J4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E5C6KVNgDEbvf4AVd+7cae1Gi/wuZ5kWgmbyQdu7TxD5Y9kjYh3NMpGOErpgeoq+walCXuWqGK6WgsLkfO3Iuiz/fYqyek+19WWOLj4v7ZVvd5ikuX7fM/1cGnEkfuKXOzO7JgMG6tH/6citex56mwzgZ3S+6CTDZBaapxMH7Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIP6F6Uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAQRr9Zb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIP6F6Uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAQRr9Zb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC2mZ649209
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s7rXRbvXwU7+wfekH6skCa
	5uexonXhISDvr9zJy5MwI=; b=GIP6F6Uo6d9hSobkFne6b5FPiO5v8fJjRNTYFU
	KMCBYZ9WMJwz58geoDhZ0Rzy+ZGXM1TGmelXfNAHWWSobM36tsiiYCeZFxh6QtwM
	nRWwD8W6TDXZksptgcVHhmrx6SXsgBRO4NZvpOeFwu888zXnmr7Vfj+2IJH1+bfp
	LR02BdBsiNMCAPgQgzK5FExQ+1vPyETCRX8aT8PXtNjvkWxhmwYVUWDNdpsxBD0w
	ivdVcpHxg80xmNtTJhyUTLajy8t7MafDMCJMG3DpSxuenwZ3aLVqFTVc49HG6quV
	6Sn7jzVdPTV8k8ENL3O5bVTzFKfVfIzm09UUCfGUTpCU4fgQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c62fu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso3085975a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785176966; x=1785781766; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s7rXRbvXwU7+wfekH6skCa5uexonXhISDvr9zJy5MwI=;
        b=aAQRr9ZbSWV/h0PDs4VUd7hOUDH/zGtl3IhJSjB6mS4OOCDjRXiplAs6QQl6gYWB9Z
         UnjxewmbMQUsKKd9KJlblBsOPOv4P50jnZ64bQhJ4t1BondTkkvSi1hXZE51LighHxDW
         B5158gazrOImDa3ZfbVN0+J5GC4sGyKr3gGT/zuoy0ufUZUZIs9QcfctB9d9Ubq6TOPY
         mfFA4eby1O0tVq28yKyy5kS7nPGlDBG2Q+Aiq/t+TsjKFphmx60TGciPrGPk9OIsh97T
         KcHdzJAc3zmiH6gV9sjPYYm5cM1m7FDlpyV4AuvLnjKblGi4DBH9XiZ5zpgCHu1X1K55
         /HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176966; x=1785781766;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s7rXRbvXwU7+wfekH6skCa5uexonXhISDvr9zJy5MwI=;
        b=ThIELMyoEqaxGXxCWbwdiaVFAMTQQGLkRR6b3YE3IeNA1GnChVLJU7Rh6kQaXNFjdc
         2hTCqXQTNSJPYR9O0nojEbDVGj+p8seVhj+EpKSN/fps6OFthsJTrzsDKtljCmaxnpYj
         fyEucrbbaOhzRUGagAATF7XxdOqq9drkSLh5xLD3WlT9HEuv8Xn+lwSR5zPB486LUUUM
         0XlitI0vUf5ibc/40p62VcYwf6cUOD4JYrBBa9MYV4LbdrGHDTcA7Ghxo+GSmLA+g/0g
         staLufrJq7QEb5PjsV2hyynVCCspqYTA1i34PIL6pCyg6wlX8YsTZKi3CExVE/057aqb
         F/rQ==
X-Gm-Message-State: AOJu0Yy3O9eCM/h6OO44qV4+eEeqV4wvyPmKGq98TEDUoAsYx0j++fkD
	505tPe5Bu/+VKgLqyc4kkunBdJ47CP4gX2hZkaCpVaz+SX29E9BszyOAdvnchsI7SWNcrD0cneK
	lZTEf//VJJYGdpsF1xxPFc6xIpu8lO1xjSZu/OtuQPgg1kFL33cn5QS3NfVlahSTI/LDEs93c00
	Po74k=
X-Gm-Gg: AR+sD10t33h1EN0V++TXzhg2WmAgfC/3BuTApFvdUaZG/8uu2k4j6b/9Q0Mirhp6iiB
	nZ0Z74NlzGys3C3UCdZKbiERzPEeDy4gaoHi5PoJhetq/JOv/SH0i3fJtjt2JYP/2sPE1Dwnxip
	eMMpuUuZmGMOiHHll+kDR9IvlWOzlwep89lDZEByEq2Dbg3WZCYXvZXqiHYNf3CFlzg/CLZvYUP
	AT9N+P69emkBXX4TbbJ1Hbl64k4LpllPdONP82OpF6234Tsvs1ijcIe8O2gOu9Dbaj2r2+ijuJZ
	JRHlCb1TjB0J4jwovNaGRLOfouA5Yd4L47FbfqdoJo5DORy3C7xyt6FeDqhGrJ/Uv8mFeGjWQtR
	a0wIK8K3e2t5cgaoN3J+n9JNNCdY1GVo=
X-Received: by 2002:a05:6a21:3418:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c6c80438d5mr740525637.51.1785176966514;
        Mon, 27 Jul 2026 11:29:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3418:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c6c80438d5mr740472637.51.1785176965916;
        Mon, 27 Jul 2026 11:29:25 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm31963087eec.28.2026.07.27.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:29:25 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add camera clock controllers support for
 Qualcomm Maili SoC
Date: Mon, 27 Jul 2026 23:59:08 +0530
Message-Id: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSjZ2oC/02OW07DMBBFtxL5G0uOH7HjraCq8ozHdEQeJQkBq
 ereMQ0IPs+VztG9iZUWplXE5iYW2nnlearQPjUCL2l6Icm5stBKd8prL8fEA58xjYiSbMkeewu
 uR1GN60KFPx+159PBC7291+h2jH/N2DyKXftb5Ik3TsMZhxlfJXrSYJ1ROai4G/H/zo/qVJDHj
 Uv6YGmBQvBkgMDFvf02IK0kcR5H3mJjA6WsvTWQVDE6lOCwvneA2jloS0d9h7kHcbrfvwD/99B
 UFgEAAA==
X-Change-ID: 20260727-maili_camcc-e4fd7c94b59c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a67a387 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fMwyTfTMBRYe1uhAUZ8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfXzilVTZxXVCzy
 NLTGpjgIN9yCyijct2CjKHNVCrwotuWDTOQIqQI95mb1Ekz6JgvLc65MnvnEaYahCL3SgLTD2/h
 M3k2Z1VhohsmEQMZcnoFDKtbTqeHrGw=
X-Proofpoint-ORIG-GUID: JLDEWsezrsZq75Twwdfcb15Mfh-5b66y
X-Proofpoint-GUID: JLDEWsezrsZq75Twwdfcb15Mfh-5b66y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfX5bvMoJGKpDEG
 wYqRvxQShTGDzp8VgB16oZJjyNRrEVw8V3RyJ2rXAA+TvcMuTvjAPWz2LgvlDXIrMAEmsY1d6Yx
 79ijAw9LRITgWJ6pf/KS577eFh2j6W0rpSIDWWPUN+RhxGP4uiegwIsb8BbRbKPifx5EtuK8dL9
 MxkmW/DGzX5c9NBmcayV1+/Uuxjed04dgCiPnQj8D/vnd3b2o1cIiVPy1ghHM3LQE1+QWiZt+yl
 MsZrH3RwzlUQ5OIleX0sK3TIo3yzAfLAzTTAO7A+H6gCt1o+mwEy5X/xSiM+9Or8hyamsE9pjgr
 cwRQHUgmGhTwSoUff83ZqVF0zh7hy5FheLBLm9sMG3LWkbJulSaS9uQvkx6EuojV/JqUjXZwJHM
 O9ixP02ybHPm2Y80oN6wRX4H6/AQAkBpEYEcPGwuK1ESU0FVvkJUmSVtrE3pkHydRkRMtFFWafq
 HlrqT9ndj4SBUYSzVHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270170

This series adds support for the camera clock controllers on the upcoming
Qualcomm Maili SoC.

This series is dependent on Maili gcc[1] and Hawi camcc[2] clock series
[1]: https://lore.kernel.org/all/20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili camera clock controllers
      clk: qcom: Add support for camera clock controller on Maili

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 +
 drivers/clk/qcom/camcc-hawi.c                      | 158 +++++++++++++++++++++
 2 files changed, 160 insertions(+)
---
base-commit: 48ead2743ba0f328f85cfd75bc255b1f6e96cd9b
change-id: 20260727-maili_camcc-e4fd7c94b59c
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v3
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: 3e9a75794efb1633818ffe387d1f4e5048c361a4
prerequisite-patch-id: 4b5fc2ccabb6be0eef59a9a223a228bb1ecba981
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a
prerequisite-change-id: 20260508-camcc-hawi-4be887e3beb5:v1
prerequisite-patch-id: 9fbee6bee0a3235a188c9380c8d7574f5a4774c2
prerequisite-patch-id: 38b41881b46403d8f8ec68b5eb12654d854995e6

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

