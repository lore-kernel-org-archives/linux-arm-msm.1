Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846126;
	b=Kixk8qmpVgyO0g7gKkRCda9R7X7x6RQBqQTyFkLwlZWYsN38qFoOJaGfwv4or8+8Xi/I
	 IJUDXOd87yHdZaZ8FlT/0gTtzeKqugYvwT6yV+oSgRriuc4o+HuMPllcTKoZ229Wlysa/
	 c/PPrxkXwLb3b5uT4+M/bv4MI1WRk7NN9oJ6To7CD9Ho77dikLDCaJDSyBa5cPeDHVFwS
	 i3ZnhGzKQhNXxe8qE/vnQJEOiMFTzpwIVOJ/oefF3KfWyVwegL5YYTuEgl52nQPOvhrpH
	 dK4N0AfpPvaXVpXAFYezTXc+vTslBA70jLQuUADiE742YeWUVI3XFYvdaH+wjK2LHGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
	b=T6MC/THOjT7VxVJmK37ZgCbzj1+RSPYiqQl3s5RGff3jAb4CWOXtGLl4aQBFIcMkaFGh
	 hkNxTMCqiAmeTTN4O5lVnwg9l3xWyNye99BTOoRJsi5Jqf/BLJCn6GRnLpTJQUjcnRyNX
	 HoZ4ul+omlO19HIN7jYTjp8PW6d3/7M+PRLW5b+XUIviUFrfYlJliyWLcPRFe9+d3WJ0J
	 hXFFI/gJ/3rXkJ+8J9thQev+10oxhh7i0zWMM55kBISN+lsmcxhGbCbrqdtmOLU1sbc/q
	 WTAD98/5r+OdGoo1OYLsoR2ejuwGuRcNyclmaxeL3LYuctG93JZE6seGPEmlKJ/WXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7OfNETp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn6B8mkZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB9C606A322
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB9C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7OfNETp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn6B8mkZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGKAHS3693035
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhh
	O4gHPm10=; b=p7OfNETpEr68CLI0FHZnru+WSdSkOWcv95PEkSOO17XhebYpD14
	DfEypxXf9qv30Nno20G5GbZdH4vUA3yytNSqTdr3jQyerOMYoNX1kbXLqUeE8Xm3
	z2Amb0sNDDdy1hNjpFWoKsJuhvJIplQtmtAZGdMXE+f5NlINe+yFbbK4RRC5Ytyb
	tAUx0aeQRf8n+viyoAihM06FWVfPSZD9kU71jhEz7na1nkNmtBuqcuBgrY+rrbAR
	ZFAyEDhlZ/4gSypJ2dXu9AQmSvDFrhSrR2tpFFbE04k+Y47f95sguXhUF7fnxqGz
	TLMba/Bnqx6GI/MB5R1SWBV8ytMR4dK7m2A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f8104f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so5163172c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846123; x=1795450923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
        b=Xn6B8mkZSfmNeEcNaeCxnrHt/+2ZgdGHpcMa5RaA87K7Hbkk7M4aPYMvkrEhFiZ2vm
         Rar/ENgh/HHaZ4bTPH4FLFFlLcYSD3ATSZWPZpgLjLTwMNzBByyDlqWlJauPNryGHRlQ
         69591C/kHb280LmTy8Ch9EnuOFohfsuDTq+ZGB4Y0GRLTQXv7SCQn3Fat0dxcV4jpmNN
         SZAWwunZ+vsmhJKbvFDN4/moW3PjPJ/MCJV2HynRxRDHzuv69KIEFUYweqkseCQKSzHL
         5T4Y8lJzf+pyYLvjj9R3S4KhJ0470t2TdJLUmP4kkJETvASA6Ha67lfn+432dJvU+PQI
         Vd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846123; x=1795450923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
        b=rdlv7/qZ0MD22cAzyU/TffVCPVPjeXTzoB3vpqDaXcRI+rDYVLQCwUeAABVcQ9uZF7
         aALNGQ2AR4b+u5PJQyRYh8B+/8Tt98y0+6jpy13mJsswBE/pWnRGoV7F7bNk2XlY2B8Z
         JC8uZdJseM809HnOViNeuTlzjdFmt05ZKt9kQIXp1I9+zoZFc/MnNrLgNwyoCnVBnDgs
         VfEqHYJJsGoSz+E1/VMrn+APy5OEjPRdXn9c9sIDGjG8o3WzHlBqaPKGYXz7cIuNPfK4
         Z54IUAItO4N2nMmBkqgs6KnsRiGU8L17nvtacoLvKBE5eRgsegSWKCCW3DuBhUej7M+D
         K3Mw==
X-Forwarded-Encrypted: i=1; AL+hErGDKO4nRdG1/5cDhOMXgI+tHQoC+oMsnOCNgdRXu6JSuUL+zc8RJoW/SzldzNv3qPwo1L3W5e8vJ0XYsHdP@vger.kernel.org
X-Gm-Message-State: APuU4Z+6nF4isMCeH10j00uwIzNC4UUEZCM+LuX9rMMjH9BZbrj1XcDb
	j9+fiWaKSJQwPkQFZ/Mz99pmPNDeY8MtUubX1lZi20ZPqaCvURZBxxNBOBAVL+j1D4p9zxymq20
	JcPV5bZbl66yAunxUinOTkxrU1dNS6qy1w3gSS3H3A+xtw9dg2lrvXsJ+eli+tU2K5Cch
X-Gm-Gg: AYBFou3UOAsxLSCsa6g48DR7gO7IeTg6H1Mw7cwG4Par8TzG7gIpkQVT3fbYjUnBMIA
	60jK2rLqiq+39QnnMdpsxmxDECXiMM8CNT4+fuQFfm4+0JuFA0S0r2tz0IjK+Jx25K6DwmdVc6T
	HW10d1p70JSNJpN0siRCxB/l1/1lv0xj/MiJNVHIQtG+MP72xbq0at5gAIdZEnEXvgcr16DEhcm
	CElF4tU2/gpLWXFhbYCYHfJ8HfE7+41yoQWjqazYbNIG5qo8qDWlcNxq2nXzF2N88W0aOZlU75i
	k+MVMFjdeYQ3oWQjEgUbfQtE6k3rQcApTbTQqHk2+8x476MWTp9OqV9BH8JNdMhB/hnEZZe70fO
	Wgw6loLzCmlLuhqSkIvBRZqK0yVNIcP0ZEgjgLxTYi3ab79RlmaI4v476vx/kDN9HRYcUorGG9V
	Nk
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr11928414c88.19.1794846123227;
        Mon, 16 Nov 2026 08:22:03 -0800 (PST)
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr11928366c88.19.1794846122515;
        Mon, 16 Nov 2026 08:22:02 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:01 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 0/9] Migrate PAS clients to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:39 +0530
Message-ID: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX87CWGi3g/IcJ
 4DHz9GRR8Z8b+Mdx6/Xhg/42wfQ+n7rE2dBqLbLM4sowLwaIYWMyorlv9WHYpPzc1JwGjh4tE4i
 nj2qwXoMKpkMyjL0wzFCmpgzaT+fSDnXT6D91Rq2vyq6cgUr9T37gdDup3QLSKyxYOJJ1kKyDAS
 gn/+xSHvK+236p2hmnB9RuVwiYgMPltXQnys9XWKfIqaCcdKayNw/bKZjyLxZYBDIrs+KnRjmgg
 U21oBT7RvBTccPeMRoa1dXwas5wlDPXf27yWyaGQQAPtnxHOv67kSJ9aVdH6s54s5myXg3UxwRw
 ZxfVCsbBVv1fpxz5++3/4h7svOlaP9zvnMO4GFvPJLYa3FJbmPtAvhuoq1WZN5WvgVarNs7ylFq
 sx5QzTI2N6pf+0PxDxBuDKYpnbHCxLMGPzlJObxUhqfqgcnPp68IBj2LKu8cnLMc5r+xlLOHqYJ
 F2j8x6Mp9eFFTMVAeUg==
X-Proofpoint-GUID: NpF2p3rpFx5webx0FI4ouZELq8awQskG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX6AI+CsVCQYip
 4xrIUOGqz++Jd6C/ibaLog6k2x+GYUV0PLncFdGyB7Z9w1xrkk9F4BtoW1wLFKwcDlVc2Q1grZf
 0uUhAgfrWy0trxaYbGd6MgpeyD3w8ZM=
X-Proofpoint-ORIG-GUID: NpF2p3rpFx5webx0FI4ouZELq8awQskG
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb2dac cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HLFs0uR_R7ZgEvxmAyIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
public function, migrate every user to the new PAS context-aware API
qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().

This series migrates every remaining caller of the deprecated APIs
(qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.

Requesting the Ack from subsystem owners to get this series merge
through Bjorn's tree.

Changes in v3:
 - Added Acked by tag.
 - Fixed build warning.
 - Link to v2: https://lore.kernel.org/lkml/20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
 - Addressed Sasiko comments.
 - Addressed Alex comment and added 1/9 as new patch in this
   series and use the  API to other patches.
 - Commit description change.
 - Link to v1: https://lore.kernel.org/lkml/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (9):
  firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated
    context
  remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: iris: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: venus: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  net: ipa: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  soc: qcom: mdt_loader: remove qcom_mdt_load()
  firmware: qcom: pas: remove qcom_pas_auth_and_reset()

 drivers/firmware/qcom/qcom_pas.c              | 42 +++++++------
 drivers/firmware/qcom/qcom_pas.h              |  3 -
 drivers/firmware/qcom/qcom_pas_tee.c          |  6 --
 drivers/firmware/qcom/qcom_scm.c              |  7 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 22 ++-----
 drivers/media/platform/qcom/iris/iris_core.h  |  2 +
 .../media/platform/qcom/iris/iris_firmware.c  | 27 ++++----
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/firmware.c  | 29 ++++-----
 drivers/net/ipa/ipa_main.c                    | 23 +++----
 drivers/net/wireless/ath/ath12k/ahb.c         | 23 ++++---
 drivers/remoteproc/qcom_wcnss.c               | 12 ++--
 drivers/soc/qcom/mdt_loader.c                 | 63 +++++++------------
 include/linux/firmware/qcom/qcom_pas.h        |  3 +-
 include/linux/soc/qcom/mdt_loader.h           | 12 ----
 15 files changed, 116 insertions(+), 160 deletions(-)

-- 
2.55.0

