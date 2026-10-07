Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C443C051
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377483; cv=none; b=fAMsYxPUvKM3ksB07xDIRa5/sHjSAbPtndLkSkmKbXoE0AK3Q4TLahV31c0AsRSOG8IwKxQpHDK+AlCxm5Q444pJfk8K7x51wIQfnNkMND19xyH0yCPzOicFQihl0ZsuVLaFmgvGkCkD/ST5NVfWZsRkCgSm362JXsAM14Z3K9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377483; c=relaxed/simple;
	bh=ti8tCeK59NnVT6ZgdMt1nmI1QkUPgRpOvJOJIvWc1Ys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cbV/1/pTt+/1EapjNAw8ASmMF0imjIq5x1vmFFA/cnkfIE7WcE1SA09aVKG1AYwxdWyUJVBF6KVRaG2FYx/+d7DfP13+DXuX8dlF5TqT8qCw1/YEDbJVQFbDDYTl9haW9bRhYfb2YGePZTVXWYg5dQrjcFONdJy1X4resYnWCDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1gdkLRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrRxJTFk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1gdkLRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrRxJTFk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV6k3640832
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 12:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ge4UsmaaPXwMQSgwmlgfa5
	Y2DzK0kEKxxkf2gt3s19A=; b=f1gdkLRRCOoKGG55UsArI7fX0tHKQUz2psYyZv
	UuGhZcE7aLKY4ro1HAtWUrw+3GU32n2OI9xkh8ScMG5zrodmyEcyA/dwBuL44WDz
	XF2Zz2th24Q6+Lsst+yS0/MD643U7gw+yh9gM5uXYvVifgxA5BdDQAf0zTOLBvh2
	4C640E6/UXTeibssFn5CncCF3xOQSIsNLLob7huhKKgvWWwQ3vfDzEUe+0dF394q
	jTn/HOrkSX+dOZ8pnH5Arvg3xsuYQdqj64JFm3j8guQ8i+igagzY7CgMPCvrwuIt
	abnAZggBzj4LTeTefyaWhJ8BhhmmiP8MWSu5qSR38MP9dYqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c71a41h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 12:51:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso6507439a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377474; x=1791982274; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ge4UsmaaPXwMQSgwmlgfa5Y2DzK0kEKxxkf2gt3s19A=;
        b=jrRxJTFkcC6q7aNwNgTDblkYg01SP0Ud6wweSJJdiGIYfoB+avQaiRTzhOuVMUyy4l
         rXnXUMI+dSh1zbXwi17JIw/iwPtwDryKZpNlOZWc31Bz9jdzUcblQsBTZsjFQXa6OL3E
         KBco1ZqfLNq6n4XCVe30zgZfI97xGL40keUlgsM70mbwbJAagWHRGvZgDqLQ2BEHQEAz
         ZCaabGUihmu7ozgAqCW6JqEP7DVpmKlgTFw7/wh/OrHyzh7h8mgykjXcTrGAc8oGyOaB
         MAtJvcW/g3PPTkkhV0gi4aBWMNhEj79fdbvp2OSDzxoJDaIB5bZWn8hVnD0sx7xHkLA4
         3UzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377474; x=1791982274;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ge4UsmaaPXwMQSgwmlgfa5Y2DzK0kEKxxkf2gt3s19A=;
        b=UPyBHn4lxBz5uDmvydZVve9Kp+kncYO6n98C0VB93uxNgzeuBDbM9fIPGrg4x4bkao
         XLfA0O+m5rCmuGleyaJtb4L/OELHsMjE3HJE5blQEhpA9dPwOqcM0MFOn63TsXxnYxhX
         JxuOEOril8h8DEVaX4kDD/pY9KGw/S1+W8ossL4B4vK+rOJxMtlp9r+j2XYOjabpzwfl
         5zu3XtnLq8oasPhQwZ37CdnrOuQn/hTyUALQBZxtZghH/zvcFS6lKp0LXapnUwHV1jCV
         F56nEkekjJcMC1SlCW89GwOnF1IvGoPXzuz3KOEyDat6RzAhtJefKF59jbbOaV3Z/+it
         TXjQ==
X-Gm-Message-State: AFq9FYLJpDWIvfNrDNgGDHcg1EOHoQuYNVVuI7KlmAMN0BXQSL2isrf4
	1ooMPigHe5dgeV9tErzoJD4FPzFLyaGTTR/EWphRnspB1AcbidndbWC9yV/OOmggkuH8vM3KpxD
	iHNNymyaIFfJUHITI9Jzw/RpCbJBle6n7quyTFbHF7Gp6nHRPWGoglWX76rWwCHI7lQnV
X-Gm-Gg: AYBFou3DLJFsxdgYmiMhuRxih0e6L3+jtw7oQ63/fguMqwPrh+OEsN2nUz7cfo2w/bO
	R4k71D/KRKP2M1lqX3cjReWR2YoR+dITMIOA/bv0poUtm400/Dz84xWw7xVxF1nZFzeMlNdb59G
	z0hFJy6h9YYAxGAw7kT2YV1Cxs47etd6RtEYLrPkIVKyYqKbSIwe85pOvrwXUBN8k4Jg6uEbAzk
	Bc9JyiL9WYDCEx6P9Qwy5r2cYNz55eXFbdZXV0BgB/qwBhOAmZ9dRjZQtUVwzhs5Jgln6LH1JM0
	BYu61MtFHnKZrMJ1F+l2sk5+2dXU+DPrzbFRdcOfjl3Hr45AtEwSsHFHDnCQr3Qx6g0ae+ensFK
	nzaqtQUGd7WFHi7O7b0Obr1oaNQ==
X-Received: by 2002:a17:90b:5291:b0:39e:24ab:9f82 with SMTP id 98e67ed59e1d1-3a8a08516cbmr1890436a91.10.1791377473766;
        Wed, 07 Oct 2026 05:51:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5291:b0:39e:24ab:9f82 with SMTP id 98e67ed59e1d1-3a8a08516cbmr1890417a91.10.1791377473301;
        Wed, 07 Oct 2026 05:51:13 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d718333sm1884954a91.1.2026.10.07.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:51:12 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: qcom: shikra-iqs-evk: Add LT9611UXD HDMI
 bridge support
Date: Wed, 07 Oct 2026 18:21:05 +0530
Message-Id: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADlAxmoC/5WQzWrDMBCEX8Xo3A0r2fpxTn2PEoosrRq1cdxIs
 gmEvHvluNBCT70sfLCzM7M3lilFymzf3FiiJeY4nSt0Tw1zR3t+I4i+MhMoFEfUMNpcKL2eSq8
 4n68eBvSkOm09csGqbLCZwE3jGMsqDM4p6Vs7WImy955zlEIr4gadEl1Frbg3YZV+Jgrx+kjzc
 tg4z8M7ucel741El7nGLNvab7t98x+ztRH2LUI+xo9kwRfYGmdYJCAYskFJY5Fa8zzlvLvM9rQ
 a7er4OcAVbL9wsGhYKiLUENiJ4Lzo5F/p4X7/AlJeH+F3AQAA
X-Change-ID: 20261007-master_lt9611uxd-b0de647ad012
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791377468; l=2210;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ti8tCeK59NnVT6ZgdMt1nmI1QkUPgRpOvJOJIvWc1Ys=;
 b=e4DBptBDYIbr85hjgmR7kS/S7WUALgu1GozPjSuj0mvuIHTqM9NrIskLRm/8cxDndSE04CCLP
 PrFy2VfNpWIASJ2npr6gsVUffm/BxbHQRWDduVh6jXbn4V/M+qBAEG+
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX/KpXfys1aJcv
 iXv7Jag0guZcc7OAxG2cFt/xphyXYTPJ27n/DfVJ1SVNHHr62JJvY+LA87HY0APDgUd+Re0+d89
 63eWx4kAxNoL/W812FxCjkP0/BCQMUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX2oS4mOu6WAV1
 whCdGeZd5MwUgU8fJhX1p3tdf4VfbeDSvYOvuqN/bwkvdmGbwE1UChqvOf3jPKpuhR8GO6vqiD4
 ZO0BRTQPe681r/8FxSxLCQ0NcxIKK+MV1v7+YWUTvWqRPgVRImqRJLXuqTuE9vlcy/tNse50p0V
 9d1dE90SUYHARsjUekrqKHGw2nQNLS+V3b39QkN5FfyxVtalQQJQjJ/XNyqibCP7Wj5AHuKY3pu
 wSlqWT96p0dQAtQ5fIurA7R4JvSwj2QvCsVnDxXd7SthYOY17VzYHo0FDCoNzKIeW/gdD/z373v
 ZTJ9e/gNY4mzYhOD2cjfwuLkrsPQyE4pKdIkKAw+NOyQn1TZejftOpTF/j4dq32iV29lgRd/AQW
 cVF39yvaGKCQQrRzTdZL0t5x9ALWErcs5n77A5C1qDuJVREODvOxE5VcrsoKkrCaG6QHKJBYO7y
 wzjCt04lwbeTwNA30PQ==
X-Proofpoint-GUID: ilFA8ePJ8ZLT-ZDumCv0ozF2tqDgyZ0A
X-Proofpoint-ORIG-GUID: ilFA8ePJ8ZLT-ZDumCv0ozF2tqDgyZ0A
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac64042 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=spVTYJvaZBYa3VVWI6cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070051

Add MDSS display and LT9611UXD DSI-to-HDMI bridge support for the
Shikra IQS EVK, and enable the LT9611C bridge driver in defconfig.

Dependencies:
https://lore.kernel.org/all/20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com/
https://lore.kernel.org/all/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com/

Changes in v4:
- Rebased on top of next-20260929 (linux-next tag).
- Only two prerequisites remain: the display v5 series and the LT9611C
  driver v16 series, as all other dependencies have since landed in
  linux-next.
- Rename lt9611-specific regulator and pinctrl labels to more generic
  names since these will be shared with other display interfaces in DT
  overlay.
- Link to v3: https://lore.kernel.org/all/20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com/

Changes in v3:
- Remove superfluous comment from pm8150_l11 regulator node.
- Link to v2: https://lore.kernel.org/all/20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com/

Changes in v2:
- Removed port-select property.
- reset and irq is aligned as per driver.
- Rebase on top of shikra-display-v4 series to pass schema check.
- Link to v1 [1/2]: https://lore.kernel.org/lkml/20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com/
- Link to v1 [2/2]: https://lore.kernel.org/lkml/20260618-shikra-work-v1-1-dc30381263f9@oss.qualcomm.com/

prerequisite-message-id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
prerequisite-message-id: <20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260618-shikra-work-ea756b564b2d
---
Mohit Dsor (2):
      arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD HDMI bridge support
      arm64: defconfig: Enable LT9611C bridge driver

 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                |   1 +
 2 files changed, 110 insertions(+)
---
base-commit: fcc65d3aba5059dd1105276e180c624110761d8f
change-id: 20261007-master_lt9611uxd-b0de647ad012

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

