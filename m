Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C208478869
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 07:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531348; cv=none; b=mQhZSrPgp3h8qxUJr2NcIHs5YOFFRGFw3ljh4s2O1QlUsmMDVuFk2dQ7KCcl2YvGE3vozCKqG9bkv/WG4xt1oVxdcwHJMkE/qUkUMUbKlOoJYmMKLkF9EC4qxLeg2Y4g30KD8wJtfnU7EIpzzXZj4CzJz0yKC+MclMgLTZWER+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531348; c=relaxed/simple;
	bh=A8Q0G9RYTiBHUt9HkBBuffrTETErXzLM1/xZEC/1Hac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qQ7PdzPeTAp+evRgqDDHvsD2qZ2/pG35MrN9TaU37AC3bXSm1szintWR8nuGa5mVqtlx6NTFRxdcu0qVoel0S4g6Xb3xWbjTFEu9duai1wjYgC99koMMJ50j5mi00DkzAgBptClr55HR0ro++a5HtrNbWb+l2+T3Ky4+6no3+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhbeYWBH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bY4CyXSl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhbeYWBH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bY4CyXSl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HJYZ966459
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 07:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PRGTcjOJL8YJLa7aIAW0+Z
	7YGILGnThcUoLje4G0jxQ=; b=WhbeYWBHMQHa1tVqyE7f5on24w88W/FIAcCnRA
	X6EUffna+XwZrcb13aOPCHRtnWFmgdNnc+y/Jyvv+AKq3531lgWjl5W1QlmV/XF/
	BoiJmNpszEqZualoeFYJnfzc1sXPPdwdDT9W/KZisP0YkgdDAPm0ExsjKTf4HfSJ
	9fcssUKC8SD5GZfEiRevNkJBX0cdK2InKiSlt83hVEPEeLbjOyM59glJYUg0cXDr
	jbWo0lxuXhZWOlC681xV76I6jSkl1SF1Kc5JRcU6w2I3C7hOZeWfYqsvnrmVInQ/
	N8uvW12mD9s6tkbu3EgkuHXRIrE25CUOXbpU6wh/h9UUYgBg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj2f1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 07:35:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35156644c96so3190531eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531345; x=1792136145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PRGTcjOJL8YJLa7aIAW0+Z7YGILGnThcUoLje4G0jxQ=;
        b=bY4CyXSlfvNjoKDC6Jpi97flTB/nV6TcVY//oYtMeEZCasRZYXiy19dfkz9GSXZycq
         iw2KP0iYGmcMpDGpb5X6fyX2TsuQezC4DktMqhxF/goVH6id8p02lrspbSkAGqf54JQU
         pWxoa4ugxJP1ITeuMh3/Z5rLyfeO99mNz82VwqdRG3d0NUnvwiS8jRYJHQid5xrtv5BP
         8tduIzaXVUtLldm8kQdT6wEnMgZ9B/ijfc43ppyd9W83dm66nwwdxuBUuVbplEHKVBCm
         rR9H0DshInMtu+pWMkVh/00lPm0nBWGxtnAtSX9izn1od5jOBJBvebAr743/02SGG1dE
         W4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531345; x=1792136145;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRGTcjOJL8YJLa7aIAW0+Z7YGILGnThcUoLje4G0jxQ=;
        b=K0SjftXOCY5/O3AVkF6vzmfDEqAVZTliROZU8EGdaZH7xk/AL9yJ17x2c1lImUipkl
         tA6HvcquZwhxBNxpeiPxb4yB/C/NfXxmjYzOMmEKBB3855qrFlDgYJKUAKGhxcBqzKlT
         s8XhOQoUdbqicO0vrLgtFW/g0n7DYAROQ5qGhooM64n4C7Z1cor/lqvaFXnxgMTEqnRB
         hypaK1CT6ovm0iZbwNJUoChZAr8lQYI2hA8nv9n2mGuNWHZ4caqjMSFgF+RyWj5kKv8v
         G98L21QeOkQv01Z4D/QRuuIfYn6yTw4E6iOUrQ99euquMAkEw3V7aqkF3Pai/GFsGCBj
         LPYw==
X-Gm-Message-State: AFq9FYIC1QXN6f7uMclbR3MNtMm4UE8LTBm9tsTEiHb9g7zR1oJV33QF
	qhBD4xU0D5ER/mrYzcsa0ZENkEjmo2R5reCCdhgWqlq+jA6gG/lG3T2SpnB0tdNoQ7Z/QtfKh9/
	WX496cKHhgvMtQIMIg1Zeu1uoWUdwonjI4gb14IUPyYRvskxU5lfty0ofPtQfA/PcnZ1o
X-Gm-Gg: AYBFou1iC/dBsxV2Z5GixCb1ea8GN+0USiav+4pq7jX7/wpS5dGNTMwu8ZwZETJwWMp
	jYP8hq60+71prk2JVJ+YC1ltMJVutBoY1oeb2RPqSiGaaXwkE3gga7ROxZJwokN393zQp0bmGlV
	VxLKYswcPN0TGsjJxIEmcgZHyIug+QXSFs1xS/iavT7EKsMz6GEB91e1WYRMQQJUKrI2os917tc
	Pggns62pPWSFtNiE1OPr4bZipr5cTcPFej+twjkvYrngugdeJ2Ju+v697a5LQb38iA4JgCnFeu8
	kYT68gU3laUWUWoU5rVglb9hc/oFdRw1q9MjQqsKf50GilOBrprFh4AUhhOX/VJXw1XRVGB13lc
	0tqTWi2gJ6EBNQyogDFfJuzPnPWKXgwSzvOm+
X-Received: by 2002:a05:7301:488e:b0:351:7ec4:8e41 with SMTP id 5a478bee46e88-3537e011139mr1776464eec.10.1791531345088;
        Fri, 09 Oct 2026 00:35:45 -0700 (PDT)
X-Received: by 2002:a05:7301:488e:b0:351:7ec4:8e41 with SMTP id 5a478bee46e88-3537e011139mr1776435eec.10.1791531344419;
        Fri, 09 Oct 2026 00:35:44 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm5658974eec.14.2026.10.09.00.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:35:44 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH 0/2] Add binding and driver for Nord SoCCP
Date: Fri, 09 Oct 2026 13:05:38 +0530
Message-Id: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqZyGoC/x3MMQqAMAxA0atIZgttFVGvIiKxiZqlSioiiHe3O
 L7h/wcSq3CCvnhA+ZIke8xwZQFhw7iyEcoGb33jrG1N2kM4JlK5WCc6Z4kkcTVIrnKItceuhhw
 fyovc/3gY3/cDjZ/QhmgAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac89952 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UK07lOcsehyZGIaRmRAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: SxC5JGgs-PuHF5qq_p1aYEfGjRp3mEr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX1vFqtm2qC7Pr
 wZJazDdeocxyyeEFPoSnSffGhP288XGRu/qMjQkjcrYC1UlbaCiNtcvFr07rwUY780Fs6cFTI/p
 N6IyYjTcYo1YQ6Bs+1ubJ36RLl/s3+oj5iAjapGO8Ml5XR/hLFCI9I10y+FMDj8FYTcHg4x2G6N
 HLoC7fEoQW3QsEZwFf/HiBSDuZe5pfJI2DEVkFj3SiZt7p4kMQZ9yC8j5jPvaNIzQbINpgMKpe6
 zuX4t2XHhOJMgavoMrqbdvCMx7KBpq3ZVDLx08kIDRFr9hbYzkC2IoAUUuwfCsPZ4V2J+Ms5q7v
 +G3O3srkw1GIDVKX/jW4/M8BluF4b2s7HF8ZffEMEw/+tn+9eYsEkTt50Jw+j8+zE8qafQ+aY7U
 GedY3mJk5PLFSyMdbHQ026iCpRWNdQ4Dfqmav7sODf7mmvqh4wh1CwKCzoJjqwpNPYpMc6gs8zb
 qozOKi/8Twuycq9QZ5Q==
X-Proofpoint-GUID: SxC5JGgs-PuHF5qq_p1aYEfGjRp3mEr4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX5LU0BNGCbEWf
 awCLOer9QLtso2AH9oEfm5u/ltKwWL4XbOyy8DMen1pmR6B0tX6tkumz6aSUbejGpEaSzvZ3p/C
 3J8TwvcV/BwW/7FZbW8n1agEUFZELTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090030

This series adds System on Chip Control Processor (SOCCP) remoteproc
support for the Nord platform. SOCCP is a dedicated control processor
that handles hardware fencing for display and other use cases on
Nord-based devices, sharing interrupts, SMP2P states, power domains,
and clock with Kaanapali SoCCP. However, its firmware ships without
a separate SoCCP devicetree image. It therefore takes a single
firmware-name and memory-region, and cannot use the Kaanapali 
compatible as fallback.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (2):
      dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Add Nord SoCCP
      remoteproc: qcom_q6v5_pas: Add remoteproc support for SOCCP on Nord

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml         | 20 ++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                   | 15 +++++++++++++++
 2 files changed, 35 insertions(+)
---
base-commit: 0312234a60912d65819167631115e39c7e8f9621
change-id: 20261008-soccp_driver_dtbinding-ad131aa42a94

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

