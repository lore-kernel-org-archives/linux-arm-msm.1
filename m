Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107875;
	b=OVbtOKb0s50NNXt4uy8g6FU1li505UwUy8LgAQu0o226gFc5zwU4Jx9nKGUJmuWrspUK
	 Fy/QSm/0MZaWDfFxSWbHOxC/echwytDd9AJpbUSfDhxB4gXNf/oils30VuiP+FpnZso2G
	 rqhnvo+TJMaSanSlr0Paq8TJgOiXum+ZUeAXJUrHHVD7Fucrfil9wk7gA3fwO+Kx8Iah6
	 GbYzOAkSTmRxLUUl09uouaIxMvZQhLhvGmuKUqAuLHuBx9f9ibs0hhxk7bW3xTVb98jm7
	 1D+jpg9KuB1xTC3IryqGnjqrNP+MhnhocZOfXESB5Vn1Ouv7oRE83g9BWl6/hTbvnpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
	b=rOXaDINIhMNTFLCunAJj2ONpZtAZMn3c6pq307DnLHObXGje4IxcpDsKnBXMQm/DeoDU
	 QPuOBEoltdf2JKbQXEP+NRFiMxAMd7yMBpUmtlzmmBR8lklRjYFtvh0htdRIxh9BA57iW
	 KJU2izvL4CLzMM5h50u0i9ZJ0SCOuR8l6S3IE7NcZpNBsa7e2iiWNWvJU2KN6BcY0rCIZ
	 2Fjp7goEVEoNvDIh4Db0kGUDUukfdCW5agf6+TRnv6+Qckd4Xjn84oR8fwSlbb6mKb8Yx
	 AMK83Kn8C9i+NQmJkLRchXue09iw1JWhVNKROlz157CHDfI75WEozJQ5dUqpkP8crTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpNInUF9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d/z+n7AF";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54B160A2610
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B54B160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpNInUF9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/z+n7AF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGs8PT3016869
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FtJT6ChM42qLf5cqURCzWY
	5hoKVKmr/U8sU1QWX4Dto=; b=bpNInUF9dvYGSsRD0rnk3iuaSPxO5q+lT6ZDNK
	6LJlOVydMfad4PxIN4iSe8Eed95wabyzMx8c1Ci4qjbjxdlj1fw+TV+AYzoNXyxQ
	l/pwBxbw5YBwIZ58E86lHre6ZCwpvhDzTwrOgsGsCgrLKx/HZd5lmVhhJAXXvi4Q
	xKsfUnfvZ2EKFtZOhW8s3FRl0EYnXpabToigEU7taHZsMDdcmKYTJmW+S3nW0PMd
	ItQFV5TCfy5UK9V8aAqIgs3qvBmy357R6mbv/9gdcjJprY+V7vUJYyOoK4++RxwK
	6FHi6QE7zTvb5XRfSgmveq7WwZJLL41zLVAnlyJLj9HIdiUg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcv404-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a073778890so23491b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107871; x=1795712671; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
        b=d/z+n7AFTRiiD98xcg/kiDx25MUcCZ5eJijxAFiK40rvqMq83bJbpbL0YybJWsNryq
         p8w44yum78LtdKX1hDrSu0E8G+cFe76aNJSsRk1fVBkYmOtypAbLrHnF+olErfsUN0tX
         ZBWjydMWRIFCoAaECNGShNREVJ3eKYjrrP3LUfTcZypSSNwB/F/AtCxJwRIAvAek9sLL
         TU+oc7jSD7fSMQLtNVNJEW9y4LDPwWs1z5Dt7N7ltvRFPHiSbT8yQv3kIWedX+zlXoEy
         AMHkSQ/upV0CJr5jsT0yF4xMYD81mkJErcDBbcfVDt6Ay3gbBzcrZklV6BoCqQ00vypy
         rMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107871; x=1795712671;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
        b=QesdImhmEsVG9qMr7efcBY/fU+cbvlKI7utuz8jVyIOFNbzzJNtzB3O9B+4OxfeTvG
         mxQ1+bj/Fyy0mGevX1KY/FOfrsKK4BFhJt+XjpHejTvKRTX5Txk9p/vhQJ52lEJoRG17
         w6y56UPo0rB32AGGFdB60GvstzWlj1LhR7k41/4Jfy3aBawuZtG9ZhzW034Mx8JUR/lS
         DjihugW3H8Jgkx9c9h0wfCPggd2f8f7sMmbNrEMOxhjLsNhD3aSnyi147cizohxhHNXK
         Q228mzr/MqQxFPvhsu8N8yEGpkb9qmzbwqdXuoOUV9KzV49viDmk9d/F8uAncFjdjCGY
         ESxA==
X-Forwarded-Encrypted: i=1; AL+hErEgkjv+Y06wAvag/3bCjMdjVLBqlVT1OuBT/aw+uxBmbBavYvPoRDFxD+gQ05OKUWh86Uo137DhR3vNYAUG@vger.kernel.org
X-Gm-Message-State: APuU4Z9h8OuSEnl5O9+wrlfBX1lV6UBWrXWBu/FY/WBppAvsxnd8R+i1
	pA33NjJMx/USVYc/i+99vfc8Wm5T2xuDUo6b2QOOfJgrI0NvCigvUvA2FwqgvReeYHzPEWND++A
	2Vs/f3vp49aAt8QUwn6c31pd/VQrg2OrmdiiqkIlYj9E3hzPBuQgqtw61Xm1tAv91Bxq9
X-Gm-Gg: AYBFou33M2iTebqwZLLbHKcVWNENOU2UvI9/WmOYYUzr7hNjewJ91wrSuM/Oap2m06D
	hUtGe9H7fUfCJBhC1NR+ndUW+PZg+x8UdQ3YIK8NCTGZBggtI9XjDclUMboXVnMSR1aek3pZ+vh
	EaVC1gNnak+9FGkNXNXGDxJktTV0ldB0JrvpZ/+1Nee0GhV5mlbv7Vq/rHg8G4pEdYUsV6AueXV
	fHWQSnB7gdLS0Nd8/qIUURAOnK9Kiw/xEKw/m4v9jOd/HkCOS0BNMu/GoKqzi7itRGgULKZHPG4
	4p5np2EbeK87noA4gRw4/eu2xmXpuZi3C7cRAy/dHW0crngQOScvCoYGa26HCza6uuR26uWNsNj
	ThCuaxVMc1wsjC0PCkuOCkkH4shoSD3KRhSSXjw46b2k1OUawX5Fw8pdyKCL03TJr1VqhG8lr/Q
	==
X-Received: by 2002:a05:6a00:2ea2:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8c8792c30a5mr302108b3a.2.1795107871568;
        Thu, 19 Nov 2026 09:04:31 -0800 (PST)
X-Received: by 2002:a05:6a00:2ea2:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8c8792c30a5mr302068b3a.2.1795107871112;
        Thu, 19 Nov 2026 09:04:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:30 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Thu, 19 Nov 2026 22:34:19 +0530
Message-Id: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABMs/2oC/32NUQqDMBBEryL73UiysUr75T2KSJqkulCNzaq0i
 Hdv6gH6M/AG5s0G7CN5hmu2QfQrMYUxAZ4ysL0ZOy/IJQaUWColK9FZ2xLadmbb8jJNIc6iLIz
 RZ3T6rhyk5RT9g96H9dYk7onnED/Hyap+7X/fqoQUhdZO4qVCV/k6MOevxTxtGIY8BTT7vn8Bo
 U7+6b0AAAA=
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: ND3ZfaWLP8-5yshaFSIzhc5wMxHj9Cdd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX7rNHF2k782IL
 0/smgzKUz9CmvxVs0surWuDrAF3ovr+NF4wCJ0JRxDjuD/g5rgNZBnXeWcL2mPsqBfPtMidxXmR
 Ma2BidsEWwWBzB0BHG55LZ7tAiwvWfo=
X-Proofpoint-GUID: ND3ZfaWLP8-5yshaFSIzhc5wMxHj9Cdd
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6aff2c20 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DIp336sofITyGauNNAMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX8pE8kMNmQ/ZF
 yk51IeodoldaToONGDu8sSSqKEYaTv7dqXQbyj0pdbgnIrUtqlHF/6rri3FFVRnWnwWfHy9gsIP
 DVfFdDAa/v0JSeK3U5yVCjjqtcyEKwzPpIIxek7/FkxGQTszg256jX1WCicj/yeKAW9jsn30FnQ
 gNz4kA+pRAcOnw2lnZdOxpHd+VlLBmwxdmn/cdnw2ZOjBLg0xioBIcX+j7tgTxZ/B5Wa5/7omRa
 6pPLntQyiWL8ZMbhDRdFfpF1W2kDS8RvD1Kusqg8ExNXgA94Q0np89sA06jmrG79OzQEiaP7Psu
 L5FM1fgxSFlJy+0dT7gTxJ/tbNNDSK1PTeSFIl2N9slUmoSP9/Ume1d4PbSWhtszqCKcoAX94nX
 6S2hkf8GSVBNdUHXifMd6umvCZGisy96j5ik7oAbBUeXbDbEYgkOlNO/NjiOrDTHE8S4FeN6QKv
 WW9g/tB14yjkjIB7TfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190067

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Changes in v2:
- Drop the se_gcc_cnoc_i2c_slave_clk_src and se_gcc_i2c_slave_xo_clk_src
  RCGs; the se_gcc_i2c_slave_ahb_clk and se_gcc_i2c_slave_xo_clk branches
  are now leaf clocks with no RCG parent.
- Drop the corresponding SE_GCC_CNOC_I2C_SLAVE_CLK_SRC and
  SE_GCC_I2C_SLAVE_XO_CLK_SRC binding IDs and renumber the remaining IDs.
- Link to v1: https://lore.kernel.org/r/20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 135 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |   9 ++
 2 files changed, 144 insertions(+)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

