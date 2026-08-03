Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26283E5A29
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759052; cv=none; b=Uf0+aoN+jJCbqvN0Xa2/8BHFeRfgDB6GTbWdZkmTqwJvgNuu5EKgujJifMgiEHdWwsrX0kjnJyKJNaAkY8QaliZQ4g0DwMNJ9m3wSLrOfP9CLx9t68WVq09hExeKF+8Fl8Jflv3/niPyjIZxE4/dPoaaewills8S2U6etgmUeiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759052; c=relaxed/simple;
	bh=bhAahT3NJxDTdKB4UyV1IZlKYqcqMFXLTf1RkZT9x6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VMpYHfcLsm4ZazHClSllhFxfDvqUqac0OwucZ2WRfB6WDpM2lQ7xhku5fL8tpVRJIsrVLWx/IUWcviN/UZt4EOcnymjHB+XepyDBvWQiBYO3GxAxCkjizA7quuOIElNN/EyG0M/i9vocjESA7E021mfFWBeMTDIFLqPfXjd5fqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIvP7adx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHtEX2xc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIvP7adx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHtEX2xc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4aWY305390
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 12:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4L9uawW8hWlFW7y8D8/6KD
	E4PdpPN3ONUaJ0tmMOntc=; b=QIvP7adxFq/YfCfcYTt6IyGSmBix37yKiyf/NW
	c5UFB7RPF+6Gy8cn6lwpIybObatiIQsBzZaUawqKavukFnU9IwuotSE2e6prH5yK
	v02tC4KO4vuEQQ/p8eVaSAL/iDHjgzqMoiTPUdVjHMp2NCRiSP75r7/mA4Z8xgKm
	KNVQ7SyQvzyhxq9q9tXygNA6v3AahKXF8ahXoKGsT+QS7IsCkvw5Yk+GGDuwQR/2
	UMtg3xSNWhzEzhgb8ZKHcMIgK8wdneQ/ZAv33Fvz4Y1idjTIO9E5hrmMNTAuWLHq
	JrBQfZ7cbJMRSnjCKvZfXkrUyJj2EeRw0L78bdMXVCkAMOqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb1fuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:10:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3644704a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785759049; x=1786363849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L9uawW8hWlFW7y8D8/6KDE4PdpPN3ONUaJ0tmMOntc=;
        b=HHtEX2xc2stJXbqs4g1/5cxgiNNZyqSkqXz42UNEL3H9+RFQZBEEUa2ZA8tQntXQic
         khw1GtvtUJEjbFFM7dKyc+sSQ81eGzSpixULcyTQCzEVORRwS+ym39214dVRNXmW0s3Z
         +xJNAHId6YuUlhFBRkKmwxSteJdl5r7UTy7LDXdRteaw13ostN8jfDrMHKEWjbrOBQi9
         cO3vxR87nMPc3Ug06B9GipBzu2cJJdmKWUW7SAPuWfxn0X6miYDWO0Ui9tejv/MPdt54
         dW4erbBMcz3YNp+0SLv40rnJsGTcr2JdK7QwFuAVL6PvwuIhM0D8VHcLVvFHcMmXGhhY
         CGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759049; x=1786363849;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4L9uawW8hWlFW7y8D8/6KDE4PdpPN3ONUaJ0tmMOntc=;
        b=IZBXemmkmX6GXIEKPaLIxEtPdDKHevzpaIk7tjrXSvocbmvbheGOW44CacSTTqfXy4
         1yFqB65xxBQHe1R3bldLAwAS8CQBZ+dbX3VKpWZ9IgYNoJNKYRvc7RIrQhPoU+TX3IXU
         ecAqM7zBCkp+cbSHMMQjHVpmYsDkDdTdYzS/BRBqjqFUKBMopJcjNuVcF1ZIAXwRpQZ7
         CxX0bPA/O98N2G7SZZoKC3X3rgIqladNxB4Bh3N2DQWq3wmu9R969xzXO+1osdTPf7Rw
         6X2ZILDiqmGKq5DLBeIEj6SI85mtIHUiVrw+He7pVPav/7UScTRj48sUX7NVIbp+UOr7
         XiSQ==
X-Gm-Message-State: AOJu0YzdnOSigvRj/52BkqgdQN+Dq0iubNPp7jS8FzMLnyGAGUJYVMO0
	zkDAu0xaPrQ4e7XlyU4VVYg6irac1kdTajGjfjJWpmNv0K9JVoHBo5cCdzaTtMBilP1u3JgDhqn
	PU1bSQ/aqrNpGSVlDNKiI4j7VhIGu3xAFBWmb+S9y6/+7PAqMOn3txYjUM7Xf+RYMwOhxC8GpoV
	40
X-Gm-Gg: AR+sD11w65Sux2RPUho12TSPuW0Ob+oei79gSv+iam6G5FyJzIG7uThGnKJIQ0So1dw
	ERSiWdP8BTIqKLP9sF0fBFL37Z/ErowII1Fi3uPS217PLhqArCdix0Uota4bGS7z+CuN6ZIf8QO
	VFuQM+MphOsH3gC/zwjGOjmOELAdaWl/D8+7z6IMIMxOG+BtvgJ3/ADEMGs764lKsZBf+obPO1U
	PKCvjNoZ+3QtMLj5BaCItByr0OAH2kNHp0zbegInFlWthLh1lH4iePDx02wEiatDJDmHX2krQvM
	UDHWTDLcZTMfSk3JYnDSdpMWpwbKUBq8bZsGvkzbwmSEitKr4gZEFDj83RKtnvkRYzw9Bo0JIm2
	9tQ33JCEqKDSEJhoOjfOla6Bv8+4=
X-Received: by 2002:a17:90b:2549:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-38fbc8cbbefmr7525498a91.0.1785759049130;
        Mon, 03 Aug 2026 05:10:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2549:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-38fbc8cbbefmr7525458a91.0.1785759048483;
        Mon, 03 Aug 2026 05:10:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30a3c75sm3864076a91.9.2026.08.03.05.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:10:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v11 0/2] arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
Date: Mon,  3 Aug 2026 17:40:40 +0530
Message-ID: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IyHpc0wAoqyVunzh5INCEepNKrf9HXBk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfX/UjC0mtjJITG
 WsM9pdvntKKRCoSVvGXXUYDR2F6C2FcJRBYc0ItJLNARaU+VA2jC3ll7go48jfT6St8oEojBUPf
 f10Sg+caOgilqbCgrfIs19M6AQYRgr8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfXxF2VORFXxtFB
 cSfz9WlvFGFhwgoxiZ8/JqxjUKSh+vQWZEbnR6yNxBbg5PcOcVRunLRPFtfdSrwwWxfmPc1aRRP
 I+Bl3vZhXOPyRxQHs+SefbjDrEKud6qdIqLhhWR9sy6BW8FUCeifGESXZjALu7imLR0u+tRHe2/
 oAEE/itISkcBWiYWgZY34M94Rv68QZ+oQ3cIEt8HuteApXiTbiWPB2DHbSUmH8IgkPeuXRubdpP
 Wuf2oERK+t8saGPcQ0Xer2P5tiNyJ2UUoZA9GbcY3EIoho/qAPVt4Ifhh1vIekFEraMdwJlhHmq
 6ElO5KwIigCn+JdcT7mLpKJyR7gSxDBPeBy/iTmzapcSYtmQwZGg9U+BD13qFd4Le0O484JEVoZ
 66U7l6zwU+y1bYnJeBbqG+i5jLq3YxzOxAPDPVNASGCa1g2XOSXis1pgxum3AJG9NMOb1cmS/3U
 a/2CTlqIhveqhnzkTsQ==
X-Proofpoint-GUID: IyHpc0wAoqyVunzh5INCEepNKrf9HXBk
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a708549 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n0mgBXbVGTAyQq78KrMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030107

All existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
this series adds the DT overlay that describes the IOMMU streams and
other kernel-owned resources needed in that mode.

Patch 1 is a small independent cleanup of the two board .dts files:
keep the wlan_ce_mem reserved region (its /delete-node/ was erroneous)
and drop the redundant wifi memory-region override that duplicates
kodiak.dtsi. Patch 2 adds the kodiak-el2.dtso overlay and wires up
the -el2.dtb variants in the Makefile.

Changes in v11:
  - Had a conflict, rebased it on next-20260731
  - Link to v10-RESEND: https://lore.kernel.org/lkml/20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com/

Changes in v10-RESEND: https://lore.kernel.org/lkml/20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com/#t
  - Nothing, just  removed  In-Reply-To tag from each patches and
    cover-letter and added RESEND as part of the subject.

Changes in v10: https://lore.kernel.org/lkml/20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com/
 - Split the wlan_ce_mem retention and the redundant memory-region
   removal in qcm6490-idp.dts / qcs6490-rb3gen2.dts into its own patch. [Dmitry]
 - Drop status = "okay"; from &wifi in the overlay so platforms
   without wifi enabled in the base .dts are unaffected. [Dmitry]

Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
 - Instead of adding wlan_ce_mem back in the EL2 overlay, stop
   deleting it in qcm6490-idp.dts / qcs6490-rb3gen2.dts so it is
   present for both EL1 and EL2. [Miaoqing]

Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
 - Added a wpss copy engine memory similar to chrome for Wifi to work.
 - WPSS does not have firmware Stream, so that was removed.
 - Added wifi streams similar to chrome for wifi to work.
 - Removed this patch from Generic Pas patch series, can be followed
   separately.
 - Moved Sumit as co-author as part of modification done to the patch
   in the past.
 - Added some more kodiak's board variants in the makefile.

Changes in v1-v7:
 - mpss was disabled and will be enabled once the dependencies patches
   get merged.

Mukesh Ojha (2):
  arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and
    drop redundant wifi memory-region
  arm64: dts: qcom: kodiak: Add EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 39 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
 4 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

-- 
2.53.0

