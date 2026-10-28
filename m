Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190322;
	b=fFm3sCaX0DrR82ATIuGhmEireQqXZ3uPPYekMBYklk2pdPSiEtm/mOGvUDJeB+YFvCKv
	 WLd6XP2kjsz5C/yivQS1q3/2JAxa/bAwMQcWxJcnE5eBxJkyTb1pUboNIYKJONwpu93MY
	 7SBx3+k+Qc6NXMVPbn9VSnfi2liP7TG2UtaBQehXvL1J5owmQbDEBZXDZQRVZ38weWB/j
	 FjdR/5okaPxiDEefhybmfwBY3Ob1A655PelD8X4mDdzYnaXNPKBhYCKLOKgqvKdX068A4
	 Hal6cjSo+5pl3mn1P0paCPdCrUK4exREyUYPUcKRyqhpfNICw4c76VrOKFumMBkPZoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190322;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HTl72mT/ml/6tKFbd/9Kva4wSmn2Rn68y6y82DJiCf0=;
	b=j2mABG27YktYvD2s1lahcU90UTUuKhgYmipZGuuVgB3gaL5HlndveelsTcmlicATF+2A
	 bPCvquyEi7OziBgiaBwtpNeVI6TGVPRw8WS0dUppEtgd1vwDXhvmTDKNN+Vz7RfocUvgB
	 Ak9hqFznz1HuJ3g8jXgMGTf5D6CVnasjIUvzF0l8TFSx9GAZHxAFsE3sEEAM9nrr8ucrB
	 etjHmKoIIR5QIdXKPxSrAN8N14B4ON/MVcoc8uHxE+Vd5HYRY5gbQGkBuvxsOLOaMKZp9
	 K1G1pDlYorScerp12Kzc9OW8Z/U/FnENJBKNoEWLeghKYIca8IqHVpIwuPEvOvRE05w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLvDdhb+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DswUYYFP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDD606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLvDdhb+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DswUYYFP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeGV0995024
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HTl72mT/ml/6tKFbd/9Kva
	4wSmn2Rn68y6y82DJiCf0=; b=ZLvDdhb+2EbyBfA2suPh3lPEMX3N6i5s7yOfhA
	hSuntSTd39+uOUit9pm7jL5B9dXd1NKCoqTCaeQDtZr0qrMxABuL2rFChbYp26lN
	b5PU3jQRnfubK49j1oTZe4Vjsh9Hzv6oebzLFoJkRKcGdbhz5kLgP6vu6n5U9J4h
	8sDdIw8WE/eH9i1FiQGMN6A3UJwwXJ7Wh03WtOmrWQfvGiF7RhyDMaqYcw8ohl+4
	uam/IOtroyylZDdXFXKTMZ65ekPpEuPOHFqwzW/2n3l4lGWYskUYXY064NJPIIQU
	yhbYpRrrC0qepm7IEj9tTrjPi3uOO+zYdxaoRUDM2Uv0AyGw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt0tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so808960a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190319; x=1793795119; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HTl72mT/ml/6tKFbd/9Kva4wSmn2Rn68y6y82DJiCf0=;
        b=DswUYYFP9/+sznkSE3JeK/uM5PIDgD+FIV+TD38zKT410jd2vVv/7Vm+rFYxoDejkH
         8p1PCwaPosOlCS3AdtYTUFNtLTdtiOWM50+dxBRzl2CGV1CHp1aFcCwmf5piUADnBBTL
         pFu1vDBCwZzmlx3xFIJfAeMNsCxV5hicISzBQ66AvThMwBJTyHo9YIhsjS9+UgkUjKIb
         Xk5hMd2s3EGcfN9lCe7IdcykjEDdd2ZerfglAYWyzC9t6AA88fAdkHAVs7Inlh5oCrb0
         9PjNFriz2KZ6k29Avb2lkpSs1WHz/JDV13R6AMxZMFDfiZ8KhzS3aNyWbQNTl/UuKBDX
         URoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190319; x=1793795119;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HTl72mT/ml/6tKFbd/9Kva4wSmn2Rn68y6y82DJiCf0=;
        b=NhFZsMWLayjZlejwxggt3fLA9ocYshoKLRUIjvFtwjl7txnw3HNCwT8Bnqs6KYxqlK
         3u4F3uDa451exDvPgUfz06EzLLHHaUHwpNT6AqOFAKcmRGeiO5UyXyb/AjGmLGeqAIqT
         LjvyKk4OaE8Nwt+L7X6RIPHwp7/aJlmBjKuK/nAWjFiunc2+B/WuIWOrwv5yg4ejlMMl
         SLMvgt6P41KZ2vMXXDRlEiOEWJzIfK+NE6NxaSPhMI2bjbwa/A766vuP7diIUZTfHO+r
         DBgivHPkgyoXzem6ayn+17D357G2qstGED/lz+oiULA/+nHf9IMlDMEUlXgLRbbCL0Ie
         5qww==
X-Gm-Message-State: AFq9FYJbvhk4aiayTBtqLE6UTfiMgUMu1Gc3gp3Ok9BBT8x1HLjn1rAf
	TFCmbkYQ1QsZa2bWxkeipV6U4TmwGZUwIA6ozPFS4oSbI7vdnryOIVlrdgW44oJNFELTW0wno4F
	OLjWrWv0FfcerW4MvQkdgGFznFMpC6SLih6bqgp0gFuu8a11LSdG92Rl0AQHfGT1urHdw
X-Gm-Gg: AYBFou3bhzLOcIZV2gQFexiefEdfm7kUo6+eBf0KBOoJXiXGBPxS0eoPGpwdhcel/3t
	SFUtGTrRy2M9rD/1Iy7FPOLUwRMd3TX4rio+4jqz4LaRb+DLbSvHZkIj6AmNbZuYq00ptscVmqX
	rF+Q1YKXWzWPuDv++C4nb4UmWBiDFRDX+7PmnGFiSHssM1crxQHKiRvzR0vVqWNMTTsQeaFzWyR
	FlxUbr1SmgrI+k7huyEZC/HhtnoHbE25+lzVlSgOYW2qzkU9d7VBFiH1JicSBxE8wTHsz8Sx/Un
	Zw4LXeZSUJh/wFTi+W2uL64tEoglhauzlffbvlwJ+ZOxhR29NQdfkuce9KBsKHXSyZD0P5+RlAT
	D4p+Yc4YXO+tyVq5bfkAY/+lSKUdk8yD3TH4NbHIXbGPJxtjYqh18y52OjUQuJ6scqQZzVgz3we
	k=
X-Received: by 2002:a17:90b:37cb:b0:3ac:a11a:7c91 with SMTP id 98e67ed59e1d1-3ae581bbd4bmr1613569a91.44.1793190319525;
        Wed, 28 Oct 2026 05:25:19 -0700 (PDT)
X-Received: by 2002:a17:90b:37cb:b0:3ac:a11a:7c91 with SMTP id 98e67ed59e1d1-3ae581bbd4bmr1613537a91.44.1793190319031;
        Wed, 28 Oct 2026 05:25:19 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f287fsm2995819a91.16.2026.10.28.05.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:25:17 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add UFS support for Glymur Qualcomm SoC
Date: Wed, 28 Oct 2026 17:54:45 +0530
Message-Id: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAI3p4WoC/43N3YrCMBAF4FeRXBvJpEna7NW+xyIlyU400J9t0
 hZF+u4bXVi90OLNwDkw37mQhDFgIh+bC4k4hxT6Lge53RB3NN0BafjOmXDGFdMA9NCc2ynWk0/
 14GyNnbENttiNFCQXRuhScmZJ/v+J6MPpZn/t/3LEYcoT4708hjT28Xzbn+HavjM1A2XUau8kc
 kStzWef0m6YTOP6tt3lQ674zB/Bag3kGQSlQPsSC2XUC7D4B4Gxcg0sMlgJ54WvFAiQL0DxCOo
 1UGRQG+WwKkBLWz4Bl2X5BcBeA8DRAQAA
X-Change-ID: 20260911-glymur_ufs_qcb_enablement-1524a497520b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793190309; l=2128;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=vIZlvxpaiYQv4i83bg/wFItskHzVhvQXocNrx5A6sUY=;
 b=hqXq+VJFu3erEx31I9fC6Su2K5r0NzcswcBlqetAN8povATEZEwxWDEjuxm4BVSvjKWA8NdYb
 YvdoPL8Odz9CZKfkEanlZYTZMz8Ns68rvSkKBfGu6Ns8NxqwqqJOVAu
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-GUID: qdThbVSnhkR4C8NBl4ZPyiN21COuagOK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfXx+BCXzbUy+Cx
 L4Ts2nWl4hddTuuMrIspB7ObS+lBoupV+9epgvzv5IDIDkJzYiS/7hxiqCKSGK8nNswvki9A8/N
 hBDpD2PoWsjlZXxa6RjpPCPuSSrryxc=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1e9b0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MjkSdyLvD0LHWdEy_1oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: qdThbVSnhkR4C8NBl4ZPyiN21COuagOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfXyj7/WkM+gVJR
 4/bWc1VUv45xLWcmYHFV77hjTvbsDNWPV8Nm3XrjV+77Hz4xt2nCPcuSVUnH1JYKZkcf373AxpH
 hElisvePOP4aF+iylkqbmPahE/eeBNC62PPuAnxvVyS5p9dIETRvfPKUa3MF0KmM2olDLJTjAum
 rIQ2JGDqE9iMn2vfaBl/cMrVrtbm5L8+EaE/nI44A8d51huzYl87MM7A2eql8rifEpaWsGpAz9Y
 UncyrhAJCQWLRaKGWhPuZcrgGQZSzMDISp98WLD56eLrEwMacgKFLSqBkQ98azL8LT3b8noky42
 4BalFQWexKV+Y6cPlJrdaq9FMu0V/ZEDH1e5JHrFoEOyNvUwjrmAzibFDcx43KLgGUlPJaV7fPN
 WEOfDc7V/kPePC3c9D2tKdF8mrKA4nJ3m/tQIDk3dcR+XJ1Tj4ak54dpYAoRIpr13X0gMx2r/eH
 D+A9SCeej+ezjdebB/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

This series adds the device tree support for the UFS PHY and UFS 
Host Controller, along with the required PHY driver updates to
enable UFS support on the Glymur Qualcomm platform.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Changes in v5:
- Rebased on top of latest linux-next(tag: next-20261027).
- Modified OPP 201.5MHz from SVS L1 to SVS corner [Konrad].
- Retained all RB-by and AB-by tags as is.
- Link to v4: https://lore.kernel.org/r/20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com

Changes in v4:
- Documented the lack of UFS PHY GDSC support [Dmitry, sashiko-bot]
- Updated the commit message for the qcom-qmp-ufs phy changes [Dmitry]
- Retained all RB-by and AB-by tags as is.
- Link to v3: https://lore.kernel.org/r/20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com

Changes in v3:
- Rebased on top of latest linux-next(tag: next-20261006).
- Retained all RB-by and AB-by tags as is.
- Link to v2: https://lore.kernel.org/r/20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com

Changes in v2:
- Added 201.5MHz OPP svs l1 entry [Konrad]
- Addressed minor cosmetic edits [Konrad]
- Sorted references label alphabetically [Konrad]
- Add RB-by for SoC dtsi & board dts [Abel]
- Add RB-by for phy driver changes [Abel]
- Add AB-by for phy driver changes [Konrad]
- Link to v1: https://lore.kernel.org/r/20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com

---
Pradeep P V K (3):
      arm64: dts: qcom: glymur: Add UFS nodes
      arm64: dts: qcom: glymur-qcb: Enable UFS
      phy: qcom-qmp-ufs: Add Glymur support

 arch/arm64/boot/dts/qcom/glymur-qcb.dts |  18 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 125 +++++++++++++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c |  99 +++++++++++++++++++++++++
 3 files changed, 239 insertions(+), 3 deletions(-)
---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20260911-glymur_ufs_qcb_enablement-1524a497520b

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

