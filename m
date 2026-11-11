Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418304;
	b=oGKy7wv96IZJ7YNVSLs87Aqow37MJl9El25w1rVVzAqZD8aXAzGEcEygPqllg4yMPyPP
	 SJ2FwrwLKctcARVNtNqfUSNzaQxrEiOjM/BsmjtPtRqkmRw6DfTW0/B1M/b6+NBg5VMA5
	 iea2w0j8wwhhHa/Ok7Oi1WVE9DN5oZgZ2ji7KMCvbr27t9QVGWrKPMEBpGn740NNfANZc
	 OqEQPfftOqq+9Rx2a9IicCrihjg/cWa52WI55KMmEz5lbrZ3Jru19FruemRfMm9fVP/8/
	 sfRzcJf/p06ToFb/r1K1ThSjVZB38QbZzqOkrgG6UZQiQs39sYyj6nbeZsHdQoQMspA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jNqtTOpN/CMznlWqUHTAHAik8BOVvz/W5FrGr0oZoVU=;
	b=kLFPQSWWAJ9nxhxVyn9Sms8BeZub0RmnXiAizJtwr7GJplyHDSaE3g+6LPueKpZ5W96M
	 90/weSuCgHTyO12kcllhEnyiDsiXTZrRjALpfwj5UUGTjj7FzdSgNB4UERxRfspOhKjwd
	 n1hKqh8JmGjCNSjAXtqLHS8VCP0GjZ1ged6oWs7N56CDBGaRqF/BhkYFmZUUU439zFci6
	 YW7K53snS3RQbzun/DkYrhIYN8zpkScSLhUs/2ap4yf2lyd/Ur728iIzQRaxjUm59p+C/
	 68GAtPbe7LGkvrUeX3khx6d/kd/PezwBHorhFZotnbkrLiPAVap2xmzFdHWU5DzEqlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="C+sKB/gQ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YrbUhIWo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61397606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61397606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+sKB/gQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YrbUhIWo
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF06aE1665620
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jNqtTOpN/CMznlWqUHTAHA
	ik8BOVvz/W5FrGr0oZoVU=; b=C+sKB/gQLv4StcDpsCWIBr4fMP0qQLPcNDkjcK
	g9H1E3Wd8zsaCq+vlsceJp0gbs6DVlHjMJ47bucBVY9APPwGVJE/DL9cQGYSSPzZ
	FxTy3QDUV/VD45bp1OhBFZiUWiDyzJzVZgxZSoajT08YYXHoo+JD8A7KwRwrOltE
	wbKaX0OlMVwtGhh8G9IVS9wGybEj6SlYH1mY7IYmRagn3XeaL2YuxsOSeo0EwzQd
	WV+DO/itrrWqoT4sNM9LJXK4fvWIzu5pK83mhuisrzcww5UvI8P/CpjOX8N0pEVQ
	j7HCrzYTPTa75gXjpxclzUtHbDKUrB3ExsFK/0vKWA3qMyQw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pter0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18741aaf8so858104a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794418302; x=1795023102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jNqtTOpN/CMznlWqUHTAHAik8BOVvz/W5FrGr0oZoVU=;
        b=YrbUhIWoTy6UJfQj7uuVEUXDnKYJzFZc7M2jbVS/5krhwOAU6ji8rChTp7oQcs3ImO
         RUY+rYubJ4O0wqi/Pch2zlA5lA9Vff/LZJNMdU7jNGT6AhFBBZiIvzaqp/MNwFEiDZYG
         wrLCqc95Ekcdu0cDs0s8mUN6xfeVzK97UrKi3ooX7/l/WdjDyhN5OVKpKzmP1UPjCqzP
         w8lNJjfd5BASpIDIvAbydMpTWRPfS9i3zhhLzWB15YUI3Jx1LGRhT92QwDIXzoai68Ia
         HKSqql6O1M0Qb8XD3C45xNwVgKiPEcTASfvTtIIoJj6QKvvAj75OZFW3HWYm2KrTrAj2
         1Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418302; x=1795023102;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jNqtTOpN/CMznlWqUHTAHAik8BOVvz/W5FrGr0oZoVU=;
        b=lTIzHFlU2r9GjTQsYwbLBbRL5pdzOUe4ZM59BcImoqvsSAVDlLBK1hxNNlSzoQwGVy
         G+KwntEdlJ2uHx9ebvZ7n4atbWbtreY4QUXLC7rADEa7bNna2YKKkD0MJy/yOz3BFYJ3
         Jorf3sDBmAw82qUCh9RIlQNdFbNa9XAvxrEkwAxt+oRoL4w5kui+nLc/bJ26XdTLMkGT
         wiTdwlWfMbX2RyyoRV9+Le94sY1Jh6KVHa+ss12W8Bvix1G1P6HfKo29uhzhJRSSIFp4
         nUjblWbOn2RB6wAtHFwIES8plGptBam5mKJjlgO3n66RareuEqjQK2BTFku6RdqO2jiD
         7S5A==
X-Gm-Message-State: APuU4Z+y3dg9Uh4Y/35ui7mj2ikmRcoExGxPVqUxUCyphHs4xvRP/v4C
	mrVAs641Dx8TsafsotfTtFjA1z+5w78c7Y+mscLXoIbve39tMZm4oXVs9o4jx/059Rh31VH5sAA
	Kcwiu8V8UdFjGQFWmF8BEPhDGgLTB4V31jPyw3J3+f9l5zPcYUks/X0Xfg8G6PBR5QvVW
X-Gm-Gg: AYBFou2cYnVeYn3gCxLAsE6gU7ZsrfPU5zMOgWzR+8Q7ZMAEpYXa40QCmXocVp+uQJ+
	oEaR1oI69yo4u02Uo2NbKpO0UK6MYR94XDim3IHE7MNczBRxwaMD2he0k83d/1U+tgWRw9Kg4wc
	lP9uwCRJjhj71REgVQmppTdz/4M9v9dvk44OOiFXHDKf68q/Ea1/dFFMwv6nfMyWUv6VoZpNllh
	tzJxDtYUDuDVcCLh72z5x0TEP0/jQmcEHXhXxUo3tPv5rnNBMzS68XvsheDgKnSjq2/oVyWcEmz
	477pBQC6/MmE2DGV2o95znNoPaCFmkido9Tj8LxDd1/NBtkvICY7ogspgjutztT3JeMe1NqBDAo
	ekbeKg7nLVGFp5I0NThWg43Mou6RE+nMc4KCRsrVEWQxiLPbNhnQcunqr2W6vHSr39Ctt+wZcMq
	F476Zs40ySto9o181kJMdnbTxLDLITUJb7a8db+AoTPw==
X-Received: by 2002:a17:90b:5810:b0:3b0:968f:fdef with SMTP id 98e67ed59e1d1-3b182f2b221mr3410374a91.49.1794418302239;
        Wed, 11 Nov 2026 09:31:42 -0800 (PST)
X-Received: by 2002:a17:90b:5810:b0:3b0:968f:fdef with SMTP id 98e67ed59e1d1-3b182f2b221mr3410352a91.49.1794418301662;
        Wed, 11 Nov 2026 09:31:41 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42c11sm237305a91.2.2026.11.11.09.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:31:41 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Add charger detection support for Shikra
Date: Wed, 11 Nov 2026 23:01:25 +0530
Message-Id: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAG2m9GoC/yWMQQqDUAxEryJZN6ChfLBXkS6+36ipoG2iUhDvb
 tSBWTyYeRsYq7DBK9tAeRWTaXQoHhmkPo4dozTOQDmFwoPWy6ARf4vVhD7RjhUbnr0hPqks25A
 I/P5VbuV/qav3zbbUH07z6YN9PwDxQflyfAAAAA==
X-Change-ID: 20261111-shikra-qusb2-charger-det-de6a4299f6c2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794418296; l=2673;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=0Pl912EABXQTovWccfrUyAncQ2UeU1pCEyYIkN2QOIM=;
 b=/eQJF7WEIaB+unxgd8L4ZnvTZuKJKo5IbHBBa3+Xv49WO63JqM4VcEJzZerYPPmEdS16ARk/s
 jX+GD1AcxJ9AK3BZk9Cobq5hbJUvERa5WcKq/IskILneqwGd1H4cbv8
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfXwlXRw/sRlChY
 RgFJbvJfT10Z6WVUN8hgpu3YWigu7cfOklik7p/L0v4UJPuBlQMHzamwP8pcJyg1WyuUnc29U/L
 WwHt3Okkx5+gCfz/3t90dmBh7E3chYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX4/TuTS/S9jcN
 GgBoaEpTxPoffrBDY+Ka7HJcyjhRl3uliLhnfeZaw6tm8jXjJLwyF/qKWuZ2TEVclMC/ElLQY6Z
 A5nevsGG9U8gbwxeFavXU9xpFgnAZ1tSvVBVgawvl0Q6JALYEkOVczXjt4tR4PaTaCCpLwqDupL
 mqUK3wp05NhtwTFhcikmtTD5tEvVjZLcPBjogxF3HpVKxlD7S6iFu24xHdDvJWhbF6m3CFmnBHI
 6E/ziijterTMG9wDz/njKJ4d4KVgNUOZFs5ABefUXVZTZgVCUc+gAy+m49Xnan+rDfqLYQhMsxd
 yceeToHy9E6RNKcRQj6Npfre19eXyna0GwoUnNsdyPZFORmYnK6M7h0Ed+XXMIvaj2E0wBsmDK8
 kyl52/lhKtj76vipknnDOMIPBd2iuf5yHxjXKKYByfraPrGGyD9b00gVLxFiJL5nBw8SYcDlpAr
 dZuM4devfDpQ6dhJL4A==
X-Proofpoint-GUID: gZUwHAqxoAUnGnovmX7MKzTYMuu2KNMJ
X-Proofpoint-ORIG-GUID: gZUwHAqxoAUnGnovmX7MKzTYMuu2KNMJ
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af4a67f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4n8TeYVi5Tk8eXVT2wYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110069

QUSB2 Phy HW is capable of doing BC.1.2 charger detection. On most of the
platforms, the charger detection is done by PMIC. But on Shikra CQM/CQS
platforms, the PM4125 doesn't have ability to do charger detection and
that responsibility is delegated to QUSB2 Phy which acts on the DP/DM
lines in its control to get the job done.

During process of charger detection, if the controller is supposed to
enter device mode, the charger is detected as SDP/CDP/DCP. The controller
must enter device mode only if the detected charger is SDP/CDP. In case of
DCP, the phy can be turned off after detection. If the controller must
enter host mode, charger detection can be skipped and hence the phy must
know the role before the controller so that appropriate decision can be
taken whether the controller must enter device/host mode or not.

Intention of adding remote endpoints and usb-role-switch property binding
support is as follows:

a) The DP/DM lines do go through the phy to the controller i.e., the phy
exists between connector and controller. Hence adding remote endpoints
depicting the same.

b) Although the usb2 phy is not the entity doing role switching, it still
does need to decide which mode the controller must move into and hence
adding usb-role-switch property to allow role notifications from charger
to go to controller via phy.

Also the driver changes do the following:

a) Refactor phy enable/disable calls to control regulators and clocks.

b) Let the usb-role information coming from PM4125 to pass through the phy
so that when a vbus active signal is detected, the phy can check if its
SDP/CDP/DCP and pass on the role to controller only when the charger is
SDP/CDP. In case of host mode, the role is forwarded without any charger
detection.

c) Since the controller probe relies on phy probe to be completed first,
during phy probe, it won't be possible to get role-switch handle of the
controller. Hence check for controller role switch whenever a role info
is obtained from the connector node.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      dt-bindings: phy: qcom,qusb2: Add support for remote endpoints
      phy: qcom: qusb2: Add charger detection support

 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    |  23 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 606 +++++++++++++++++++--
 2 files changed, 597 insertions(+), 32 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-shikra-qusb2-charger-det-de6a4299f6c2

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

