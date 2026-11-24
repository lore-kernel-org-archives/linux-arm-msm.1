Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517640;
	b=olLjxuFHabm1IMJq7bcPLWfBzsA/p63rPWGuR6na+ZM/xMkAEQGA/F1n/brnkXDciOQN
	 zdWJJ6Uehv6cUmD5aQlLmGs6XuEUE49ffv+i8h4vQJqxU3mRxcAC4NQvamL3zi3gPs5L0
	 dXISlDGzhNnfDxvBtNhlkdzSUZh4Temg+y9ZrYJxp0ga3tsRAboUkSHaLRF5PEnq8cRVc
	 5XSi51Xr/1c+XQWoZxAH8iPA9+LbrNekB9UUJxFpDKfDPwCGfXHxabLY7lVtipPPOAE9o
	 HoIYLrFysxqTzm6vWEg24GHb5JIiU2hFmPCrNaAImd/kyo9FYD63D5u73yIeMo1CXyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ogWxQ2xxIGHDPlXg+kfuqpwZhrR4bqe8TvXeM9trYbs=;
	b=PpTclXgYdOohL+kIT4uJPE2J7U5e9Kt/RWfDJomQ0jK1+Pp5h8T+M2jOC9XJeV4/uNJn
	 MyWr5y3yITRWv71bScbiDgwV3F0ME1ceaPN4Xxe3qRG/3/Tt8vHnav87pMhpu9HQiFljd
	 lnAug58/SoGtgVLtR3uWh58jGKKHd3t3lW1o9rKtzAIj76nC7uPP3zOLtunyO3+rVx6/i
	 50jE1mmSC6LMMBI2X9ofV4XfoD8tl+M4SM6+2UprMPto9F8J9RlouPfeGsNYahr4AjHnZ
	 sdmD6CdagTCJpfXISLd2novPb3JeiRDAvEp4TLJ4q4h6TbBxLWnG/UYlIJ7S+vscNyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HY9GENZp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWV+PsMk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA1606A32D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBA1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HY9GENZp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWV+PsMk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8EuSs016816
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ogWxQ2xxIGHDPlXg+kfuqpwZhrR4bqe8TvX
	eM9trYbs=; b=HY9GENZpfyOEm1s+M0PgkFPKbE9Sp3wS5UzTT6TSh3wgMdPB7YM
	RKWyXR2NXR5A4AZJpS1sNhSUYD2YVOzfqBKhYL5pmr/f48N6lMNZzp93rP9evGJT
	cKYQMys67t8w5gxjIVcpCUu73SGTArJVQdESfDJrHpmLjGEWebKSyB3hNrQNO0Id
	GIKt6VRdUhtDu150wbSbmsLG0d4YxJM9NfIjyheO/Z4CJdpcMfAUyPt36So4mda4
	7vvCGs58LmalL7SjzcNAqJnqQ5ZYzIKUbBiwdLA6WTe1XEp9BDsdavOgqdjKGW3K
	dq7AW06CCwhagdx9Ep3HzNkFhst7DYxGSrg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nue5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so11619336eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517638; x=1796122438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogWxQ2xxIGHDPlXg+kfuqpwZhrR4bqe8TvXeM9trYbs=;
        b=AWV+PsMk4Ps5mPZ5xfEZ6nolvYNhtukoVqCIK6fFnmQvLX+I4s0Do/KB0v1NpSeEDa
         qvcqac/tyw8ZmzWl7F0IWnSA1y9FKmYG2YpnsWtttwLKWO3Pj3Bv4peKBuikBahiDZld
         iNvSudURfJs1KSeByC02flwOG/Z4qBIniXK4tiDGyvoeHxEm/g81RDPJk2SzOqaX0IXg
         g3TYIoAnc1T43lS+ZUg2GGi8W+YLJzKQxsxlMR/I5CCyQYGPSZ5ctmXKNzWXUJ16DLOB
         uC7jWL+rufnAXXpgfgFNliD8RDUJyrIhfkH2HQR+gM6GmqHEYGq4SYXITyp9NyxlejPr
         jDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517638; x=1796122438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogWxQ2xxIGHDPlXg+kfuqpwZhrR4bqe8TvXeM9trYbs=;
        b=qXBrREMK1QcXIzT7ZmqmiqPTqEBw/iuHxa/UlmVyPOsp4CWA1pQrtYWpYjTv73kzj8
         Ru5csDoyQ92XtTvkY8jasuUhV7ZYYiChrXnYqOfSqTvGTi2ihr32xhJD6PxFG4PSVDvu
         PYWbrxZqcFRmbhZlVpqgdqrkVbW2WkYlcFs/KBq9EPLkkZOM2r6zrhisHT+cQ+WdDXF3
         SFr73ME23p3A4tAo2mMTaxx6kIqh1PRO4KDAnhdl5yYMAFWdm9tjlfgbWOz2cvz5RJwN
         lxOm1YwXzCF/2N5e6sIf7VHQhE2t/W+i4uJ78Zzxj3ng3L0rp5ZAL4nhE7/KKf5zjvDf
         qVOw==
X-Gm-Message-State: APuU4Z8si/aLwmgOeeEH9OV0rJz3/O/9JgxW3WbJ97MSSF3g4nzKeT/x
	j77aSJJHRKc3On8WI8ul2e4ANbreUJXFLhOGPKmnkNS1/MXjc2Ix2U6PV8Iv62C5RE6x+5UfkM9
	z9JfoA7MlWuyXPyG0gi+fXithSPJMIdyN6w+2XLksMx+rfVGnPhXGXpFDC9yA14KQsxjK
X-Gm-Gg: AZFdTZcvgChEsRNvuPZPY/F6Vd5Pp3xIaXZGiUiLyjSjZcxQ71WSU0TOugT86UhAG26
	JbJIOwMcNBujL9mwyISV5lBq+/l9dqqQn88T08krPAzPaLK0MUOwKtJrQNme8QEJgEKl88cJNPI
	ctwB2iPUqiILhWNTa7DNXKehlNy7OAyZPfDfhDvsjnJtshgsCs8gTtjkWxZrfDEdv366A3+RvXE
	HLy8T11+QIX5oM3IzNQfJha7AEVEESdM+ydKQVeRpRHp3lfJ44WzjPuc20HEcrmJt5G83bR8NVm
	12aM3lNVE5OC1x2xc27y9043eePQAYiXadtprMbD08fCxLRM9a+ek3H3d9p9JRTl/XgFkKoVo6B
	fq04WTu0dePQGeKmDBa5yPVWn1eJGeJnlpy8/WKmEKuI4x/AbzuVOQ5x8/N1hKskPMl/w/G9g8a
	AcwhRnNRhjvUFMIrf6qYUUNCehVxyWwTwnM+kM/FjdHYz39U8WFhraGLw=
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr16005451eec.11.1795517637485;
        Tue, 24 Nov 2026 02:53:57 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr16005427eec.11.1795517636854;
        Tue, 24 Nov 2026 02:53:56 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm53796353eec.11.2026.11.24.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:56 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: thermal: Add Seca TSENS compatible
Date: Tue, 24 Nov 2026 16:23:50 +0530
Message-ID: <2d8b5fdcdff1f5d0df738d84773b0ed54159eee0.1795517630.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8jXoYheJlRWx
 TsqMbDv7UrG+CX+YMyMUS/Tl5KOcp/ofKZx1MqdxTf38RPa4a0l3p+WNg9UUscCuySQT9erzigj
 MvYcyySCow/j7NQsIY3EX1/KDKw5R2gPYNXogHvwDD9TmP7f7g1q+1lG0oWpvZ8gNKM5cteXDlJ
 bhAnexR3x4jUlfkzCCUuGfakTwRy7jFxRgSRSQchvPPPKyctsODGVqh12WhF+Ojvn0SOa32qI93
 j+RJU1LcDxmtXeiBuUUdaLM3YHIQYh1g+4tJgR00+UMeSsOVLXrU3BHMAr+PNYlzXVA0dslckQu
 R1bYgby5Cmiv6I15Ins5Fut6oDM3td2QI9VIpCH/1N4RwAsSUBZIcsGOUZVdHHyI6kLjuJXraAM
 SVGw43pt0w3S0kryPNXy0ijnchL4nfcplxsuqB5ou1OG1qwf1Lw10pCWOO21DIHLBsdli0skx/x
 i8FVSsmWZkOpmxp0mAA==
X-Proofpoint-GUID: BXz7qwZNQY9XcvNpcegm3FU_YlHZuYRm
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b056cc6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: BXz7qwZNQY9XcvNpcegm3FU_YlHZuYRm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX5vDV2IBCrVJ8
 jAd6dG7CI9RPm+Zo2NQ5avEtOaLUghqeEKLoPthASb105a1nSfmJ+epJ0b/5ispTMr3BRvOjfDH
 mPRUwS0Y/42RDoi3Bi4b9TGj1NRBA7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-tsens compatible string for the temperature sensor
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..a96f51feec87 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -78,6 +78,7 @@ properties:
               - qcom,sdm630-tsens
               - qcom,sdm670-tsens
               - qcom,sdm845-tsens
+              - qcom,seca-tsens
               - qcom,shikra-tsens
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

