Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213409;
	b=e4vsu5PfnG5E+I1qSktLIoRAa4e30ahQ9csGJPoVt7a5J1NQXas8K3espoQbYNzMoYow
	 RUsQ+qK4hsFFFSJWLzlursi09LWmSKMnGpqSYu+7YH9pRqBKgsTEVQGmVy4GyED14TNxn
	 WeQcwcg4yjD/L9hsUmNntEiix35SGTYaNsDVmkYOZ3rvd1ooxQ7RkrJE2l1nSwfXH/kfw
	 nl+UCEkVRnzN5OvoYFwsDWumRJwXBH+5G3Rkem1ZXNLz67SOAzq70SbOmcMXsJRqZJWzb
	 p3+Tcmhl7gUFOvWnSqSlzZcPkQ6gQJhCB1/MdwYaxTLfZ262g4Y3oh+oXtwktbOsIfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uOzLF8eLJwbDK4JWDPkveOiofSVzTZ67nNELT64ujSw=;
	b=jW+yKLkIKQ4SozmBw0ESc6XgioxarM98pkvHjExn1uWuHh8Xv/cHKTRypu0czOU+R2y/
	 XxQl4kfeX4t5z6oTeQnAzqIuOgFRj6A3ktsjMtDO9rGPWlInDBy+o+C8DNKoSTuU8S7dV
	 zvEgVm6x+B2b9tN6DSuQOb7c+2NlgkGMq4oKQ53mZxpcTtvFJCRp0IJeWiLEqu+gWfPmo
	 rhu7ERXf32GF1hs1SvCIQy8Wf2pOkw6647zdTyxeRgttqjXQe8WNvj2t3JMUEGXi03SCH
	 teJPldYKIH06UisG3/34IR5CaOLkVW64IU+1XgoY68gHVUtupwHb1jzOs8BLwjQOhrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwisdeFY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O/FD+yEI";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F9606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303F9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwisdeFY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O/FD+yEI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96ARLc2007713
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uOzLF8eLJwbDK4JWDPkveO
	iofSVzTZ67nNELT64ujSw=; b=mwisdeFYZ3VpAKZaSQkU8o6V7IrJP/+j12zvkk
	xHCXqoF1J3VRCOEL3HHyBv62ai+Ym1fK5xjf2OUGuNPip7IaPEt+TUc32Xx4+g28
	r6fqOmvN2h+o2xoqmJQmYv02jgGldWV6MRG9K04S42DSpn9PmvjXlkKfolD3rph4
	AaCVOUoib426xLhTtv0TYKzhx5Opj4XNCqUtWPlyKCLTHcrY0zyjuT+v8NBlonw/
	b3wdYMxV0FcZjppuuDIE8oUetLY4c7RULCDk9GxW8r4hvqqJiVQrKTQVAzCHrCoH
	Hpp7a/p+sbe1eeXFLOiOuodkOwXA/xMq7SAxN8iHqmfNJfrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k59mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:36:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so36507785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213407; x=1794818207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uOzLF8eLJwbDK4JWDPkveOiofSVzTZ67nNELT64ujSw=;
        b=O/FD+yEIytl9NS8Iqtq+61ae+bHAxHDxtCKL6VYiC6d6sn+VNDe5G6LDd8XJT3GfmB
         iXy2e14HYHMZxfpoeOCGBQeDTWjWgp8zxMQOSwu8G9p2ldhK1VcFgOPHeCBz0dHo8ihZ
         VE6nV486rVxxDqvjsU3b4oHeClLRS1TtqZJXXLjY5scF7vFtJaTg3F5ugLgRWJnnimto
         P1WdSbqIdlOX+nqvfLqLj5IJSFPzo5wgs7mpw41nSKm9s7G4IaTOmpW2Ev3UfnLvfxme
         C6+/aU1vzhPC3tzwitlH+oHqm4eauvPpMkyf4PZpefdW7WbDVKPIg2IUNfzyKAmpTO3R
         p7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213407; x=1794818207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOzLF8eLJwbDK4JWDPkveOiofSVzTZ67nNELT64ujSw=;
        b=JBML3/qvYpCxEShOmqbk5iLA/ny9F7NTpoUqfzOn5erLozhZLlXeY1HVIV/SXrQ3WP
         BN09a//w3/H7bw04KH8BCQ+xxQN2RT3cv9URga2qN3VaCdiW1+U1vQfN8/gzACxhbUV2
         8SNopbsSlSnL5Gq6AcioB0ww2B3FXJ3bS7S6/L/5jer7kU+iV1ep9LUDz6ZL7EtO4NLK
         ToaARxwjJ/bhxLPLdYrHywRtCiebV2PugIhgI6YOaoo4e7UW8wgqhh7Pk6YyNPogO90V
         MQwa50e46m+ccL2xS43SdYLOKkCMsSwG7vwk8g5sLOuIzInMEByBOW4EQTRDt3PjYwDS
         xwCQ==
X-Gm-Message-State: APuU4Z97MFpvJ+ozGaw5Q0Um+IUH+JaL1QRd+r9ETuyMizokhfB4hsqW
	M3Gw4lQxttCieQ5ccmB7XChzpqHh/ink5B82tZN0G0VGVyTsbVUPYX3fHcitPuJXWgfMQrWnBVb
	Eu+xLa8z1elk3RmRR51lCgNgYEwYzH9T3ijmeBN7EXFStTmJI5iMNqgqE7S8zwkGcIW2S3MPdtZ
	m+L2I=
X-Gm-Gg: AYBFou3cX+0IEXK9jzUDdDqanaevbbtz/rGtLoGTWK3o2jk7Rdc6ioNYwmvYmXEZm4F
	2y7x5SXhdJB08G7xr5jYJFSQ3GBfPhKaZJtMZZ1OVL3tzASPDCOcT/lT8A4kTyxfuIuH5FEVFwC
	Nn7Z/HW89yQMz5cgVoVVf6yi3FY0+y0DGGQ0EAzKvHtj01Bv+aj5co7TzqQhM4VH07SB5hHfPFA
	IXwue5GRbRgeu1DpblVmviz0Z7+80Ecd6wJ5XJ+mYLguRT86cXJSPKu6mu0F6H+hGeLDTObfKz2
	iVQNFHYmShnoIr2bhTgN7V+hW+Nn0AVqoGGsvejqrNhrDmOGEOoTaskCoS7avTMLst57HgOezve
	V3uvNOv3IpmUQDutsWVfSnAfU6q5zrRpNqmMhFRvfM4IWTjAt/ETLmboH4JvL2hJAmRz4vAZoQ6
	RtQWrfsVcUNBH6sX8wpk1gVV5g2j3Of+R+N8E=
X-Received: by 2002:a05:620a:3188:b0:93b:ef24:bc8c with SMTP id af79cd13be357-9478424cf8fmr541944785a.47.1794213407063;
        Mon, 09 Nov 2026 00:36:47 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93b:ef24:bc8c with SMTP id af79cd13be357-9478424cf8fmr541940785a.47.1794213406477;
        Mon, 09 Nov 2026 00:36:46 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:36:46 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v5 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for
 Kaanapali
Date: Mon, 09 Nov 2026 16:36:34 +0800
Message-Id: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABKG8WoC/3XPzWrDMAwH8FcpPs9Flj/T095jjGFbTmtYmjVOw
 0bJu89JYcuhvRj+kvhJvrGShpwKO+xubEhTLrk/16Bfdiye/PmYeKaaGQIasAi8K93HkUpEHkO
 DEgCtR2J1/mtIbf5erbf3ex7S5VrJ8V5kwZfEY991eTzsiNqkRQAPrabYJCV0jBidJ0dBWC2RS
 KEJbLFOuYz98LOeOYkVe3DRJDhwZZx1xpCJAV77UvaXq/9clu7rs2IT/gON0FsAK1BLFqUNTjp
 8Asg/QIBQW0BWoBWJTFMbSpgngNoAKLeAWr4AwXgrSCXZPgDmef4F/U8KvLgBAAA=
X-Change-ID: 20260720-msm_gdsc2-cb9230027a2d
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=3262;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8pqsefRv58up0CB5hfDBMDlXVCBA9MTDI8e9At11oCI=;
 b=N/GRBrc36YIjEbo+kUgkWNMws3DqmS3uLiQiPv9kHTIpVEuPBsx9WVt48drQi2PuyGAjmVmnN
 7oqKN4rq9blAXEvRiPHV7GbnMesopQTvzuTLU7XEVY/3WiD23d2Z4W+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX9Qqc67vZWTY0
 LzCKf3gbtBwA9rdbZZREaYhbjTEdeeBKTplCGVfXpA2jmeDbmraJMllfv5LaAdEl1OCSwLotOkz
 WzTidiXyN9BKcx8z/blmRKZsVZOBlte1M04vYn3lYT5DWqjyB51fIZuRJWu5FHvJyvD/ggckSyZ
 rw1LZH39oExtOpnAkapYWCyWIQEAov/k/+NN8hHT0AC1SnXB7HjsDYKDPgg38pGUzAqUBYJP6Iy
 LNqW5ZED8uXONFMGkBfFdnQAO6OxvL39yhGS/WzmJCqpmIBAUgxLNvAGI1ikBtFvXptiNQq79TP
 cZqPzdNbr0DqgbfVRt2/e3lwBx7LBiVVsih5dF4ieYyHv1bAakZlxlnxgk5g5zjdeUAGPgEdFrN
 2evjr4ugjwrhei2Uf1e/Ypoko/R+CCDogjtGhLx6/npjYrrcecTp5icJ0EbsV+mGTrE/EYcQ2IN
 xSFqc+/2DLrHof9nhDg==
X-Proofpoint-ORIG-GUID: VZcTg3vfYYZpW5VHTZKDaSh0sQ0IGthP
X-Proofpoint-GUID: VZcTg3vfYYZpW5VHTZKDaSh0sQ0IGthP
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af18620 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d2OlSeRB4JJFOaS-wp4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX5VSaZiqaG6lY
 glmptVx6C19bb8xw+Hd3lkiRDRoRjkPCubCFlISAJjNFL7TdMCG1bhAmaeTZYJdxt82DY7Ladhc
 aWs4XYpCCiQ/2gZ9d5cYm1oYo9cTciQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

Kaanapali (SM8850) has an additional INT2 GDSC that powers a
subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
it, those pipes remain inaccessible.

This series describes CORE and INT2 as the DPU power domains,
updates the DT bindings accordingly, and explicitly attaches both
domains in the DPU driver. DPU performance-state votes on CORE
are propagated through the genpd hierarchy to MMCX.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v5:
- Use 'contains:' for compatible matching in the if-condition (Krzysztof)
- Move power-domain-names items to top-level properties; only constrain
  minItems in then-block (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com

Changes in v4:
- Keep the widest power-domain constraint in the common schema (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com

Changes in v3:
- Replaced MMCX with CORE as the DPU power domain, keeping INT2 as the second domain
  (Dmitry)
- Used generic "core" and "int2" power-domain names (Dmitry)
- Propagated DPU OPP votes from CORE to its parent MMCX domain
- Updated the Kaanapali MDSS example and fixed issues reported by dt_binding_check
- Link to v2: https://lore.kernel.org/r/20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com

Changes in v2:
- Moved INT2 GDSC from MDSS to DPU, as it only powers DPU-local source pipes (Dmitry)
- Dropped Glymur — only Kaanapali actually needs INT2 GDSC
- Used if/then in DT binding to restrict second power domain to Kaanapali compatible only (Dmitry, Krzysztof)
- Dropped PD_FLAG_NO_DEV_LINK, let device link auto-attach handle INT2 as runtime-PM supplier (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com

---
Yongxing Mou (3):
      dt-bindings: display: msm: Add INT2 GDSC to Kaanapali DPU
      drm/msm/dpu: Attach CORE and INT2 power domains on Kaanapali
      arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU

 .../bindings/display/msm/dpu-common.yaml           |  3 +-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 34 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++
 15 files changed, 104 insertions(+), 3 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260720-msm_gdsc2-cb9230027a2d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

