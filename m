Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608297;
	b=xq15tFWp1AMF11IY1wYmxZ+y7BqeGZpHbmLp9yJpySCkNWdqxSZO8dJ6iOB1qWZl9EYT
	 XTmKMpXCaaoGbamkPlB1rxRvuUjFOnaqSP8jPVO77pJwu6wuJWRwd1g/RcwJb3e0EN5Ln
	 dHnErSybjCKmRzOkKMLOhYtzvrtkfEkXy0v2KN9dBo+BiUmSg4BxG7pOvwTlzKGHTcF1b
	 KuWXMWeaHfsv69+/K1D/fU35t0BhpY5MD14kmX23vCyTeITKXhuVIfcEx3lb9WEUFuU+9
	 d9iaEacwEkvt8VkKPIRzTxez+eKEY4RTkSwSW/SBeZ6w9KZzcy4PP1UUhvbuME6hT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uMYB9Ukf7PZSRlLsRb/17nPBPI78tPEvnCpbI25t39o=;
	b=zjyRhdrLNlihxqx1yh9PGUv2t49FJ0ztBJBBhUirzPt3EIwLX5WsxDt04zBYV0kDJH4s
	 Yt3cwiIFBDV09feQ3y1pQWDap4JgNzM6tvCzDrmRPVFFx4l55X90XOpo1GxL0bR+hus3C
	 G0Qqcy+dyu8WloNu2caHKZHDxYRYLTRKZ1PE0iC+NkVAA3MKXvz1KzoMoA6sASYIWA0dG
	 U0QbUHujwXx3GcL58JKnM9uMn0/BQ+wqeiwWu4s+8QOf0CVbtUMj+pR0KBioh2Nnlm0NP
	 QK3gda6hYO4I6+vjgQq/QseH5xAAxPm6+3nK3xZjdz+LsKNs4mZj50mE0KtHoQaslmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1vi71yW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=goY8BwUG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24EE606A336
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24EE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1vi71yW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=goY8BwUG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vLGB1676238
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uMYB9Ukf7PZSRlLsRb/17n
	PBPI78tPEvnCpbI25t39o=; b=W1vi71yWuacj7PkulWZKjD4qLBxdffHsFSFJKe
	hLlMwV+nqExr1gnYwwK3meM8tIPUgkDPJTIKXHjDpz89/0KfAZY3rWxkFuc3LU23
	FOUn19PgzjWU6b2rGBwnCAxQ5M8MmOcZDRgT+P8iixwTN5NwaUCwJzUMtPuzjTZ6
	MOSy+8xQOlu562EXpiCxu0hgaZ2jzF4zR/z6C/wgU3vLb8kfdPnVwsRR265oe0Pa
	Nl/LSyytuVcoHIQFZTlnGxoivegh5kvq049IwXTKZjMj6oFBpsBJvqk78FNXZi1n
	9HeZRk76BRa1Peqglwk39HLiFAXPEg5U3mHcB6V2iaEBRIOA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7wwjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:31:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e05d31e54so1838364b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608279; x=1794213079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uMYB9Ukf7PZSRlLsRb/17nPBPI78tPEvnCpbI25t39o=;
        b=goY8BwUGZyqdLM1m1qiwoDmdd6J1eqRmx9qRBZjiTdyoruv7IGUsDTrz3VCP8MpX8e
         qmxB6dBEWAC+QBLJ8wJZlRw1tSOU+fqBBrvoYpGb63/avIj5U5SL0AjeTaUQD88zfIZ5
         WD7QrN5yvPf7ib7pflpCf9exHZVOSOViLSzXV1RbNYwAVgCOwhIlzSi4Rcvzm564tpF8
         mOuAayKzH9qBNm9U5NrCPqJUpmTv83DYwDszkb90Vl+cHIxfVZhrgviia/peXXDR2MHP
         juUUQB2fWqnogYao8ncPRrQ54S4BVfOVuAehovtPlJa+ZJG8fg0D6uUm2ecjJZPVKu3l
         inWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608279; x=1794213079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uMYB9Ukf7PZSRlLsRb/17nPBPI78tPEvnCpbI25t39o=;
        b=qIKUVBazumznjqSpsO3JpYEGeVuhyXUk3++4qeMTxb8nBVm8SzgA6PdcwMgr+6gFQN
         5eweQ4lfdXmWwBnuGdN/H8jB8G2/RXHb1QEYL3cpRSZf8aDCYPfWZQzlbox6zB7cNK35
         nMrVXHssrSaUTbvj7WjTwJblCGgTZauOTkW6TKx02GoJ8sWp2IgVfBfmnMc082/C0RZd
         DU4L5dRea7oTMRbSivYiXO+EU4W25gqeT7BpchYzxpG6QRKUzwKPG51eLJqb4LRwg7H2
         K9K4u5QgZNTqLvp5AE4+dardd8VR/lg+LQ8Bm0lJaJDR7nWrD/dbrf5WJOOfzkbcbO6Y
         D4GQ==
X-Gm-Message-State: AFq9FYIqgUHgTzJiVlFhxLmr7HKYQv+0NbKO3NDi6JTbqtplB862e2vL
	1wbglWVYjTx22B9XOtTFVMVS6euWN/xoN+/BX5HrlgaAAG+g+MGF3GUWD7cspwEv7veruYTMLlz
	7oMjB4Ft5hGf3HvCxb3COmzBW95o8GxUmr7O3idPF/Y7kWa0wFef6TZ0dB3tPQdzzss3G
X-Gm-Gg: AYBFou0v4UKES3ky262/um4Vo/ueldbhFity/BBj9T6qMwEKW2kJCW7EHcXk3cSEIoS
	LpZUhtcpCy9Fr4RoRh1pnVL84wTMb25W4RKAmidQV7/Ser8JGZ5ijWKgfp9pxi+WZegBGFL3uHa
	i4MDAAEM53dVOlIWHBCUDTMr/9HlCzNLFuOBGhWzBjtDII9WF32x9KPRbFPdjYG/q7ZgyVPwD/q
	M8bw0L7YKJgya/0xGclTfZX0Zux34tLRcseirnAsWVg/zSKdCaax0LmWlhaiZkmmTyH/XFf6T1L
	1anWjPM6FerJWR+OzF6gPrpEKL7Z20LjJ7B4CadH4/j5ab0y4wXEK2xxNE+tPJ2os6/5wjnTXdt
	eWmglN77qSKII8VPC4MRaWqY7lgNPRQ6aNQKdZvgG89CL4yrfNxCYLlCCSKEqSeu6WpLrHjC8M5
	tDdhF+oA==
X-Received: by 2002:a05:6a21:828c:b0:3e2:200b:dc24 with SMTP id adf61e73a8af0-3e928b1a148mr6877468637.90.1793608279264;
        Mon, 02 Nov 2026 00:31:19 -0800 (PST)
X-Received: by 2002:a05:6a21:828c:b0:3e2:200b:dc24 with SMTP id adf61e73a8af0-3e928b1a148mr6877443637.90.1793608278752;
        Mon, 02 Nov 2026 00:31:18 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:18 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v7 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Mon, 02 Nov 2026 14:01:01 +0530
Message-Id: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEVK6GoC/3XMTW7DIBAF4KtErEsEw48hq94j6mKAoUFq4tQkV
 qvIdy/Ooq6sehYjvaeZ78EqDYUqO+webKCx1NJfWuhediye8PJOvKSWGQiwwgrP0/3KK9X5rnJ
 CwIgYpfeatZfrQLl8PbnjW8unUm/98P3URzm3G9AoueRgvdIYgs+oXvta9593/Ij9+bxvi83eC
 IvRCbcygAueUIvso3cIYcNQi+FArwzVDB2E9ImyJrFl6L+GXRm6Gcq0SRAyJb1hmMXwoFaGaQZ
 5o6RSKB10G4b9NaQAuTJsM0znMBgIaG38x5im6Qf/rFDPAwIAAA==
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=3324;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=G5NPjxUkQvJJP+CDo3Xybd8QTltubPZ+eNMbx/UPZDA=;
 b=HZJhg9wSGdENOnWDyj+uqK8+1TjvNtFK6AlbEJkorfTODKGPHr6t3xi3NJdFiZR697dZXNTrO
 aiK/AGrwAqsCYwr1OnZ/B6sEMuuRtR1VUBXoZR+d1gb5v5oD/iPtX1l
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: 689lCTqjlPpav_8gn_1WRqDmExTyz6_U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfXwaJ53Vkq4VaX
 X2IJqUB81zuGDXYZay/bftvc8H7bofKcwN6qrRaDcZK161N3O/UMhYgU5SBMjlV3kUKb4JFOV8y
 D2glTiXl/lsaDXaHQlzYbqmFxAHgjKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX/U6kH2eOwMLN
 0Dhod0kmsnPJ8MCYYWpJETW0FYh+bYSSUDSQS9Q1NRkhV06raFatcivFVUI+oEAD17BODkRGRnk
 EbRftwlJexS35Er+w9aeECeC1tFFEJnhDd4eywMVmPLVHWXWZXjcAD3I4S3DzmFzMWOHajJkfbT
 Vaam6e4RiBhVyKtRmS/R4ckacVGKBa/nOOqxc0Dew0lHZqRKtv2rE3Kgrb4OgKe1fuwgUvekgts
 0AOWX6fHQqCEuHVgb5xJWzFT5PpoUmyfaWJVhws4b2TK4+SvQ4zTTgJiSOP8b77AiTylXK+Zr8k
 ofP9UYLwRB4K2o3FWi1TJS0QcoilrheHnqJMV91KigfS/z6JOdSk+wvHC+8bhGKKnf7MCPA76+R
 JaszdLGxd3a9FKoq3Cwv1sxiZgHCmi+kBFGwXTiBcNbkijMNglHFQIK/yYVV/oRLwcdNms/P0au
 IPIN0CiExOT0R6kYXtg==
X-Proofpoint-GUID: 689lCTqjlPpav_8gn_1WRqDmExTyz6_U
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae84a58 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rtvGdRlZkeXjFHPAfbIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, some DT set:
  qcom,nsessions = <5>;
which duplicated sessions inline during context bank initialisation.
Upstream feedback indicated that this policy does not belong in DT and
should be handled at the driver level instead.

This series iterates over CB child nodes directly and synchronously,
replacing of_platform_populate() and of_platform_depopulate(), and
configures DMA/IOMMU for each CB itself since no driver binds to them
any more. It also moves the ADSP session duplication to the driver.
The qcom,nsessions binding is deprecated in the same series.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v7:
- Call of_dma_configure() for each CB device, as no driver binds to
  them any more
- Skip and destroy a CB whose DMA/IOMMU setup fails; defer on
  -EPROBE_DEFER
- Drop extra of_node_put() in fastrpc_cb_devices_create()
- Link to v6: https://lore.kernel.org/r/20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com

Changes in v6:
- Drop unused dev_set_drvdata() from fastrpc_cb_init()
- Use device_for_each_child_reverse() to destroy CB devices
- Return -ENODEV when of_platform_device_create() fails
- Add a comment for FASTRPC_DUP_SESSIONS
- Link to v5: https://lore.kernel.org/r/20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com

Changes in v5:
- Introduce fastrpc_cb_devices_create() and fastrpc_cb_devices_destroy()
  for symmetric CB device lifecycle management in probe and remove.
- Replace module_init/exit pair with module_rpmsg_driver().
- Link to v4: https://lore.kernel.org/r/20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com

Changes in v4:
- Rebased on latest linux-next (a8406e6c0b79, 2026-08-25)
- Link to v3: https://lore.kernel.org/r/20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com

Changes in v3:
- Add patch to fix async probe race with of_platform_populate().
- Rename fastrpc_cb_probe() to fastrpc_cb_init().
- Reorder series: sync fix, nsessions, binding.
- Collect Reviewed-by tags.
- Link to v2: https://lore.kernel.org/r/20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com

Changes in v2:
- Added patch to deprecate the qcom,nsessions dt-binding.
- Kept the logic unchanged; only split into two patches.
- Link to v1: https://lore.kernel.org/r/20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com

---
Vinayak Katoch (3):
      misc: fastrpc: iterate CB nodes manually instead of of_platform_populate
      misc: fastrpc: move ADSP duplicate session creation to the driver
      dt-bindings: misc: qcom,fastrpc: deprecate qcom,nsessions

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   2 +
 drivers/misc/fastrpc.c                             | 153 ++++++++++++---------
 2 files changed, 89 insertions(+), 66 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

