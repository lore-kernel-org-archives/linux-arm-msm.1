Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628249;
	b=Ln9xJN9xPWsSQha9plDczU5X2ENNWIgQQcOyaeDGfXZ7DFIsPQIbFb6SuDc45QFCgaKi
	 GLGfg9XFkEjoc8Psb2KGdMyNdwzAafSVCKACm8cenMCzFowmRMTBv5l7XLGtLuN9q/NLq
	 nd6D4KN6BTD8wdJMcFgaMtM/xHgfApER89p96DNkn8AVOlhhCaKNxQaEjavQgn3TIoNzZ
	 NwPSebo3gDm8XSZE4gpqwUCRen3ozczyMR9+ecvWuW/SwDV0toGhJQQd2DYpO7T4GZh10
	 lgEk0Gzy7Fro6YMBuZBSl+775iGifzj0WdQrnw22JAl1NxaGT7/dbux4/1rTMZme4Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
	b=YF3nzTr8OR8yxXLOvfMRHrb/78Ih3mFatpy9OSMymXBIzfWk4jq1SSgVv+lqBvXrP/ba
	 sVlBtOOC9/k/kAz8A1BI2pSnW3ApJ2K436phzoFNABRwD1jQW3yX5kimUv+c5GpGZLp+U
	 7zLRy5VxWb3kqcgY5HoYmPvpoTSqz3SsCdANSVgTrwZY6pSKfpReKJ+jGbLUrgYdQodHu
	 r+O0uclCxOFKguctWQ7A1XKgPG6sRIh7oYIzNxXAS6SVI0ID6hxDxOv/cBmp9YAPjO5p+
	 AVcN2QnhITT69TaXLAEwzzpcLF40ymHvwFHWBxHid2aQEL4cPiYTiKYB09hbG6lApMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrXfdHH8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ML33df1E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459760A261A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2459760A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrXfdHH8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ML33df1E
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp9ei4033830
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kj8Fda6uHscKvI7NgiMuoD
	qrKd7/WCO1xgYEpbK+uUM=; b=ZrXfdHH8+h939oqNvWMMRuf2TVYcTjeQJ6dsxy
	Q+phgL939WRtYs3GUxzjgdRoK5qwcKgCGj7zjFd75L+8EIy1t9ZtVcNTOwA8OPuS
	eV6htRKbdPeZQ+bLsUdsgbxAYCh4rR45nTWNxutmtvAHR9Zmhw8FdxUK/5/QKdiy
	AzW6vWbE2JeERHRsOEP5Fd92d3K0VydUkz2K/xrciWUK+PzAmZkGw4x52UDAbH2i
	xhljz4O1f0bMLD9rLmwlsNmlIDrcondlUWIB/e3ZVkKzdVNB5lmAzlHYbg99xvCV
	zuYW6ckTzYgFjJR4Vt2cNT/eFPF1KttOSFFGoE2mH41RaWvQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9e7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89ff475a0deso2748132b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628247; x=1794233047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
        b=ML33df1EAtM/4gakNWiF9tXCLNdHsKpHs/bnsVI8KA/3ZlCi40jjNv5dg0hKUgVRes
         trDX/9JjfPAaQxEuPHyUR/U7+8xDjRK/GGh7rKvfguFEOg5vOw78AlO1/4n7G1UZqYvv
         HTQDGecjrS98WIBRb/3gdX+C8+X4ilfVa7EBN1v/8LMvpTl6x/mRRBlk1VJe3xusb4FS
         n+G/9c6M5FaorFl5tbaXLRfF+RcYXk3FXYs2/JjmJ+j0ABtFZPFxMwCTEnKkbi0RKyFm
         MddqDONEdxE8hoCIx9QxC1SeOG/6PVlNl8S3GzeQ+KgbqRBnO3DsN0dnhHJilClryeeR
         q6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628247; x=1794233047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
        b=xrXcCa4Fyo/N/24fhI49hsCovorqlI3JR4GF83mcEtQlMX5oYgLwPMhJ2p413nEGk4
         3pDW0beKClMICf1T4wAl0Kxt1FQId1rBPcDvnULb+WDjrlVErOs4tuJnW2u4+AdH5xAy
         3sxUxfIHC6rsV/6OovU0yn1t9thfOnQjQexhWz8My3gdVl78tZaxZnIr5FXRvqBFCb6j
         T6Ad0pNoyKiWKhd4U4FEpx711d99Rg7jaaz3S59sqldmipOuJebBoiaMA0Gvj7uKS+E4
         k8F2DvLxw45LL/WaeqqfoMly6jSbPqRmKm89u6uIxPYPfRNpv8WRhQ2QWNKWQOW/oaby
         vUTw==
X-Gm-Message-State: APuU4Z9mt5g8wClKwKVg/LyGjP7URBXsAE2FW6/iTQrnHa+2u/339c4q
	LC8IEUILvHTa334hgosNGhkpnx0xv/FzYUmaIJZ/AKqeElc1R7pfABd55nis4UeXzW0HqmGGteO
	K0+3920VM5eWIns2yhx1sktmkmwRuI5ENUw8HEsvqHYRwo3zypYlVnSyGctKkbx7+0q9AmNzo3l
	D6
X-Gm-Gg: AYBFou0z87zIqslG86LcifGnac7TCuyzXqwaBqzPelVSsg/DzBqBElGYGJV3VDT8vfu
	EsXHrsnuE12kOyVixEYB6E+zSeYffWxGT4ES67DxGzwMGAhtSg83TLr5CuDssw5bDVmeRh06EzC
	DrQWp2LgiEC/nI+cS7DLO5gDfG2UavdNeYU0nKOK99sv+LiMIaVBfVeRg0jp9XcJCic4gOJ4d+z
	Rn/3ZP7ZsSLXTEpNi4MbTpDrv0oMb9ryH3H0lpc55R42AeKLaz5ltFo5AhOeEhQyX8pNk1qj3Qh
	vQ4IYl0SZlk4i9nJwEPHSAlZqNwPPWHiiwpylbAOHO/ZFVou+lxpbLe+5bOqdGgSNmA3W8ZX6iz
	1L7jt2/p6BCzFMOb3rmj9VoagOYXVe93ZX03kPQTDpbPtkd6zr/Qi/jtMq9clbN+eyf8wVO6J9p
	w=
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr8213962b3a.59.1793628246668;
        Mon, 02 Nov 2026 06:04:06 -0800 (PST)
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr8213908b3a.59.1793628246113;
        Mon, 02 Nov 2026 06:04:06 -0800 (PST)
Received: from hu-ahari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm2286942b3a.3.2026.11.02.06.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:05 -0800 (PST)
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
Subject: [PATCH 0/2] mmc: sdhci-msm: Add firmware-managed resource support
 for Nord SDCC
Date: Mon, 02 Nov 2026 19:33:40 +0530
Message-Id: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADyY6GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3eKU5OT44uTcTF3jZBPzpMREi5SkREsloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loAPCZ+um0AAAA=
X-Change-ID: 20261102-sdcc_scmi-3c47baa8dba9
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae89857 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cGx-myOgvVfTzkcdCuMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX23sIuinXMM1M
 2D9DDA61R+08+RdZU4n7dl60Y0rt3QG88gFOx7t2gsgAocCA787W6EdpfwKbBzwgwtauN+ANVjT
 0ogqtKDTounLK2KsRthNLJYNrWhkD/h4u24xca0h8hJpQ4/XIJu4O83oi7jLP/w9uCDVJ/Cvc33
 XHPlVfn2sszQHpMwK0y4vSj1iEMLAlC5oQEr+cgZPDDE1Vybp41JCGKpEppTroTKdNdGG3IJdmM
 /ECxSObnu17EFKNYE7j4AZwx3Zc6I8hUP8Ke8AeVVOBp65MuGmLNAx4zefl6Jh5EXXJu7qW9Kx7
 ImT3s32AogLtWDpZzTjuGTUVA3vKXwS9GyONk1P13oajO0YvCuMDRqZF4/G3qC8R08Ejji4/Py/
 cosIwG8JeI2dHxu0Uf2j8ynpasYelBuMLd/9QCRsLKqFqRUOAlAg2LNZCrUcYFDYMhngX2vxDY6
 S7US/R9mZoTsiBCNWaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX67xiCHgxQeu7
 gSbCDDw75Ug+GlQWs6aTJ51QNob3g/JezgfVXTow4BjRUMCXZlXvhIPyLq2ni/eeWu57eWFUq1v
 1S7TIZrYSyaT1852MQN0/FXLlhG/YpI=
X-Proofpoint-ORIG-GUID: lbS06n_WhvqBmVUtrxE-jm_Hhhdsifc9
X-Proofpoint-GUID: lbS06n_WhvqBmVUtrxE-jm_Hhhdsifc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020055

On certain Qualcomm automotive SoCs such as Nord, platform resources
including clocks, interconnect bandwidth, resets, and regulators are
owned and managed by firmware rather than directly by Linux. The
firmware abstracts these resources behind logical power domains and
exposes control through the SCMI power protocol.

This series extends the sdhci-msm driver to support this
firmware-managed model. Instead of directly programming GCC clocks and
PMIC regulators, the driver operates through two logical power domains:

  - "power": controls the SDCC rail. The driver requests power state
    transitions via pm_runtime_resume_and_get() / pm_runtime_put_sync()
    on the domain device, which are forwarded to firmware as SCMI
    power-state messages.

  - "perf": the SCMI perf domain driver dynamically registers the
    supported clock frequencies as OPPs by querying firmware at probe
    time. Clock rate selection uses dev_pm_opp_find_freq_floor() and
    dev_pm_opp_set_opp() on this domain.

Patch 1 adds the Device Tree binding for the new "qcom,nord-sdhci"
compatible string, documenting the two power-domain properties and the
absence of clock, interconnect, reset, and regulator entries.

Patch 2 introduces the firmware-managed variant in the driver. A new
sdhci_msm_fw_v5_var descriptor is added with its pd_data populated;
probe detects this and selects firmware-specific platform data and ops.
The new ops implement clock rate selection through the perf domain OPP
path and route suspend/resume through SCMI power-state transitions
rather than local clock and regulator management.

Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
---
Anjana Hari (2):
      dt-bindings: mmc: sdhci-msm: Document bindings for Nord SDCC
      mmc: sdhci-msm: Add support for firmware-managed resource platforms

 .../devicetree/bindings/mmc/qcom,nord-sdhci.yaml   |  89 +++++++++
 drivers/mmc/host/sdhci-msm.c                       | 213 ++++++++++++++++++++-
 2 files changed, 297 insertions(+), 5 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-sdcc_scmi-3c47baa8dba9

Best regards,
--  
Anjana Hari <anjana.hari@oss.qualcomm.com>

