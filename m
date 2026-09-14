Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D74314B6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353623; cv=none; b=tU7wNNHELb1jIO0DvonbYjLBDVUK39x+XvrSZoHRrn7oBxZDM64XdsRQds3Rn4yAAiGw9JZZyVfV1gp1mP+hFYaQGZ7542XQ3vskGdPj7DBCq7c01YWTtBVFwVn29u0CGtCViH0lXAYFixCL8IRlTOmNLn+Hi7MsPn6234jR+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353623; c=relaxed/simple;
	bh=jq4kTlpV3uRrIiDZcZ7ot9EzjLJSv6OEC1hEhMJHiZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Azt312l3YEr9G92oWoA3Hhq7/Xox2wd/DrTTzZxqQybl5oXKppujIRr3bQCeySkea8VgbSpX+zlczh5Sw9mA04fzHOoPx9cJrvHSSO13sO16IOPONYoveHzmtgL9h6B40xXw4XK/GsG2hiUbGa2FzZk58YSDd0XG05f5Y7LL6a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3J5ncMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cm1r9fuT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3J5ncMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm1r9fuT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eL742742399
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTj
	T/YfBGa0=; b=T3J5ncMouHJ2hSSaJjwzn/XLHKNfj5LjULKzGTYIa7CtzABj2LR
	yjqr8LMrpeSTqr8ccpMdM6mcLCAtn/6FKouT+OKQCfCPATRrui5Ito7hk8IgjWFj
	rnMEA6rlgoRSS0vtJgkqlORvVIZE66tTDIvrEaNaImbIiPjE/X8H4HMFpp6VA2DV
	BGKxgj6+wRHj/Sib3jz03T6QfKNXFlXk3CPJ8YbWTDywvqSsq1IVs9Md+ZTH5z1V
	vfEzEQspKl9Kj29m08JXFl3H1J++iFi18AfHi21DuYtfzkfOpbd1P0ibvTG50TPC
	oKefbgPPz16OQ1pZvGwCaMGXQJadruoVpkQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018mkfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:40:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3405284a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 19:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353620; x=1789958420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTjT/YfBGa0=;
        b=cm1r9fuTcb0K2ayqzG1u3FW9fHiM4/Fwjew4amyv1qyW7hb0u5NtZLAuhL+QK9TwBZ
         2ui9a83Oa21TDk27btV5J3juusTWhRkxMIHG/vlPzbBMFGEm1B//qaEIurupUFP8Y/hi
         QarMsf5ahRHPJw0uXmz2ByFe0tX1v8EFeVt/5QKyH8MdUxpdIjTm1S7We5umWNqWQhNO
         LkdWpVq4npMnksIdc82eIrRIeGtR5xpEBdlwigryvl/KMMh2wEESc44xUA8Vk1i0quPH
         9Xu5FvljG6yUfLdz9iBDTGIy2uhJnkgS4oE7F/xlU7fjanWxGgXlUw4tXtw1hHa6TZ3o
         0vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353620; x=1789958420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTjT/YfBGa0=;
        b=Dd4EDA0S/IedSw18U5/D9rLMsx/EskmECbDlR3AK3kyusJ2XAGARXAEpzhlllgEcnf
         32PG2SKpM92rc1xfLo4afOKeG3MhDbzTMjReVCbphDD5y7OFtFjQovTZx/HWH5BqUV+x
         iQzTugvwJany+4RvQWMTpjg/Si+36X3UEfbWr6xCkgGPhTDuXiIP+lsFN91yNFsSkvwZ
         jV0xcPucW9LC83XpuVQ4ObaxFvnRKk9GDhpbsRCiOeB7SdGd5IDOjeKw7KBmrqgJcFN0
         CXlhKDz9TRFBH7CTD9+CVmFm5AtR6fyCMYjKhCe4+3rr+0pISS1j/fSHJHRx5NXTtVWI
         0CJg==
X-Forwarded-Encrypted: i=1; AKwUvBxgVN3XwZRH38Y05TuS8GF9XS32DKI6NDUYDOphsK+TM0wSrthKkZnRA6BJuFF79oMz+p6RdKOQg0dpwP9e@vger.kernel.org
X-Gm-Message-State: AFuF++l0M1y0ygFpxt9FBDzNd4ym/ehQoissE7HPOSbgkKcI9vX5o+Tw
	H/U737GbfIekj1+6mQMd6XJIiPrL4ILFJaRbhahYeGty2bnP7ER4+l8sumFD5zOfLVq465357wD
	yMDLiRv80UH4ZD8yHXL6znD9x2/2AwlRuDd+J3BS+Alun6Sok5Yol5uHHwzEsXrcNKxR6
X-Gm-Gg: AYBFou2OofT6bXiPhfxALZdCBN9rO6o2SKAw9iFgSgRh0J6CfFpkJPkbOHiA1cp41B3
	X2A1FvZNM6cFZ47oVgwxQ4Nq/wLig1nwb9vO0VZpIVDHVrYhohQmEx60JwX+Br4rarZf0s0inp7
	ys+6NmJyu3RABtom0FJ+cSgoaVFvsPhRtTaTdRrywrtdxMEsnT+GNiyAMs+WU/QbRb5gUV8snrY
	4g3ghSGL8+AyjBIN5EIRGGZi0mhwmWR5ZFIc8OwbnapKHaiV61oV6UJrZf2YPXd1PdkKD1BayLw
	1FwQHi1zWFj3e/tgLMWC4n0AAWtS0Ne4xHSIOkZ57TxPZEqAb8mqteemSU9/PYQW62A869G4mMc
	joL06mOKh6drtDKi2kolejksmWHoz47tcv4Xti34jUxANZqksKSvCW4LwPSje
X-Received: by 2002:a17:90b:1f86:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39debdfb22cmr1677071a91.0.1789353620371;
        Sun, 13 Sep 2026 19:40:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1f86:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39debdfb22cmr1677007a91.0.1789353619937;
        Sun, 13 Sep 2026 19:40:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm25943953eec.17.2026.09.13.19.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:40:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Add audio support for Nord platform
Date: Mon, 14 Sep 2026 10:40:00 +0800
Message-ID: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa75e95 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rXtzl5NixRRfy2LdUdoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfXwyIncgR8GJDK
 VkZ1ize5siJH6BN3iJ9TvGyDZthfd7+w8NCxkkzkfrHCwFGis0pDkXfImcSRfHiGbwlNklhCMZ8
 SWaZxgaGe5NP0DNkTIKy+iLttCimNfo=
X-Proofpoint-GUID: RIDmrn-ZXs5GfSiE5RPfNSFKRwsZVHT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfXykY9Hnx6m/Ci
 Y8jxQHhQy2JNGHeTuhRZhvD2EVh+HdjfmhKPovRYxk76bF6TdZjC0tswCEwZzDPPoxxhFBOadwJ
 7xPtc+y15O9pszTtwa5b6uxMaW5KIL6tVEZhPipfx+e/d0Jic6WaPIaGA5TsSTgH4DLRFrGO5mP
 hcGaXf1Ey5JJg4N9W6EPjG9SE53rV6sFb9tACkSykMHZ5MNMEOkLZWvlvFUDqe/lWLI3MG3E4HM
 tekBTODGJrT+5GkvVG3/dUjRBAwTqykMdzgoUtVhmExGJXR3mqEyDEM8PxN3G49VyEU0Ym97XpK
 7ExhIZBHqWqDh8u3aGzX2HOGrBEms2dJw72DHRa9NQa/6l3DnEOkX+XSStYa4GK/i11rY+lTTp2
 974+kGpi7U1ZwL0Q9raUtZvfQvcSZE4jJLIVBlLYYj2UcJ702htd32JjFRMXV0HmMJfyEzWu0bB
 6FktToj3OMQzHra97FQ==
X-Proofpoint-ORIG-GUID: RIDmrn-ZXs5GfSiE5RPfNSFKRwsZVHT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140035

This series enables audio playback and capture on the Nord RRD and
Nord Ride SX (nord-ride-embedded) boards.

The first patch adds the GPR node with the APM and PRM services to the
Nord SoC DTSI, which the Q6APM audio stack needs to talk to the ADSP.
The remaining two patches add the board-level pieces: a sound card with
a PCM1681 playback link and an ADAU1979 capture link, both over
Tertiary MI2S, the codec nodes on I2C18, and the TCA6408 I/O expander
whose hogged outputs gate the DAC.

Dependencies:
- ASoC : https://lore.kernel.org/all/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com/
- Prerequisite DTS: https://lore.kernel.org/all/20260911142040.100263-1-shengchao.guo@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-rrd: Add sound support
  arm64: dts: qcom: nord-ride-embedded: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  30 +++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 112 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 112 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  36 ++++++
 4 files changed, 290 insertions(+)

-- 
2.43.0

