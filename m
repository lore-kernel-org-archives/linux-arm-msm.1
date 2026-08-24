Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CDC3A9630
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568564; cv=none; b=qmhsfmdO+eKlWHddQiwpDWbHQsF8bwaZh+6h3+FGlcgjcnTYXmWGKFE0eS9+6Bj5/tMXnhekZ0GG/LpOOLyCPupHMNVxNKOaC9mo+4HnJO90TDvjkxdNglpZbMC72K1Eva2/g7mcNcZkGxR089150bJwNZFV6FnMoxUHkStzDPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568564; c=relaxed/simple;
	bh=ANnA+2kwuTCSv9U2a2VFjXOq4cUZZZE0B/UXz7fbkBA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HimkxiS6/AB5C/2PwEUgL6yhiMcLNSanOuwu9WHIxxCDzCJ53rHV759b8JmzqyX+1UoB7URY1q26lNBXCxU6COlTWxBV0TuYjC/gqKmEwvDx4iHRlOgEy5BKxsIhKFRDrByjoYhDYg+clSSbMkqdwEUZKpI/gKnsbrMi56J8/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXzuErcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhpGp9VW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXzuErcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhpGp9VW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99L4m2900992
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W9AqnDvUfk80kJjzC49ocT
	OI/5jiFU+rbZ2aFlURa3g=; b=iXzuErcGZlnJOYFQMy8GGdkr+0aZ4cDTp1H/tG
	AwkrVGyCHqKhR9us09At8KbH25AehjnjymGX0Fu2KsbM+X01wrhH68NXHeqo5bHM
	K4vg5mt7IvLkCezkmKRnjuOt9+7JGbqMq0usAeZ80ki2KYXIpPNFeDHiA4AaC4lM
	scgBWUjbLi1RJZr6wPlx8FCxBG07L02DElaed0o+wcLTbtLV6HBq8f0/vZsAGgMo
	5EzKegBGOVkHutDKxMR74bwMyMyYfFZA9Pwk3ncGKzPZSvVcQoszdPbBntjxL/kj
	WeLT7Z2eBwUw5PytC48iLLEMquErEOueZCK+UmbT0r1JqlnA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgrv2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso5872782a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787568561; x=1788173361; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W9AqnDvUfk80kJjzC49ocTOI/5jiFU+rbZ2aFlURa3g=;
        b=QhpGp9VWJ6fkKzk+VxquzacxjGpo+m2hnCYIK0ux5t0CqGSjcs1OXp1cPQmpAol5Np
         a3AtBLSPKrt27vzdxJUmIYxF4I7gqmjUl8i9khtf+Vx53gN7YFrSOcnttUFt+ASLclCr
         TC1aKtup9Bw7N7wCoZ+EMmF3YEE3nHRKhIiAaknqu7AywIoTF2oWIf4XTS2pKRLjmwEe
         sK81umCSeIIOJg3twkywKKHAu5LnXpiybDHiNxiucbRT7DS70+BkNu+HGn0WzAvhusk8
         2eUJScJjX38Gri3aNGI10VKfVuhm0Uxu00JuVc+JOEiij8sIEGJ5m1GIA/qyiTjkOv7G
         Xc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568561; x=1788173361;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W9AqnDvUfk80kJjzC49ocTOI/5jiFU+rbZ2aFlURa3g=;
        b=FCMgQGxOIRoAqRScl1xqzJml+ZnBrFCsxJ4jVt+Vc9ssa1V8TsPpw3EGiZh6lv+kVy
         V0Spj3PpAaDbFDCmaB+fIT2mRsapCWlqhEu1NL+Il4Aq4UwHZrTZHBxjwfNelLh5xgMh
         yekmjVA8YEcA+5gzHSuePkwigMIHSkfxOhu6wyni7If/dt0hKdowGJUtKI+UneiHsokE
         wjVbf5fFWU3fpglhOPqTdUvkygcSd+CEKHibUzuW5NPfnHKKHJgm6Rh4EaiMLnL2kGQy
         LqEwTCLvoyJ3AwUYhVXPhb1zhXbU2ebhsiwwyyQ8fOVbr+VmmbVmuX5fx5rDDR7OoiJ9
         qwOw==
X-Gm-Message-State: AFuF++mmvOY/1pkFV2duG9gmYB5XB3JvqaAwZDjJbcztDdB/QO31DVYz
	3CQ1nyhjjOXPvNfF2eBC0GkUF02kyIRUGjAelBfM6x9qEH8hFuoknOwGQXVvB+MWvh5zWJDsPJe
	9kpSiBz0iNSvg7kLFM6pUrdz1hr2V/wgMiSiqPwH78LN1BtjDJ3kg2uFIzQPpJ89kxyOy
X-Gm-Gg: AR+sD12oJ7hWH+UAkKZDULiSzQACNRzL5eZi5//k7BAiKF+4JJPywyvD544T5xV9MSV
	HCKlMttU7u67DcA75xZkZWBUfXT+6XjpGTFC7loNu3r6evYEjpGdzFb9cBy/ZDSQDuf/ENCpVKu
	Sjmk7qPDgIU/mO7t93UCQeHmqdLzgwUgOCTeojJ8t4lS2z++aN92E7PI9YVCRCdc94NdEyq1obU
	dArOA/dBZjxlzphXlp9+9PMNwO+Qe+ObyyT+tFqQFn+1tAjDpWS9ijunv4rccqrYgYZnMidOtrw
	6TCzvcSbRssKtIxWTvnOl0JvRIjW1UKgvWH71caEOn1kO2BklG7Ke/ddr9IntYnBjWjkuDyB0yT
	GHpYm3iX8+mGfjJAy8b8TN8+8Jnpe8UVFfg==
X-Received: by 2002:a17:90b:164e:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395c352fa60mr37363936a91.9.1787568560583;
        Mon, 24 Aug 2026 03:49:20 -0700 (PDT)
X-Received: by 2002:a17:90b:164e:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395c352fa60mr37363831a91.9.1787568560089;
        Mon, 24 Aug 2026 03:49:20 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91ce453sm4125829a91.4.2026.08.24.03.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:49:19 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v3 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Mon, 24 Aug 2026 16:19:04 +0530
Message-Id: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAhjGoC/3XMwQ6CMAyA4VchO1uyFYLMk+9hPJQxZIk4XGXRE
 N7dwcXE6KXJ37TfLNgGZ1kcslkEGx07f0tR7DJherpdLLg2tUCJlaykhnYagS2vdwyWkAyRUVq
 XIr2MwXbuuXGnc+re8cOH16ZHtW7/QFGBAqx0UVLT6I6Ko2fO7xNdjR+GPA2xehE/xl7WXwaCh
 JZK2Wmja8Lmh7Esyxu6fuuD8wAAAA==
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787568554; l=2038;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=ANnA+2kwuTCSv9U2a2VFjXOq4cUZZZE0B/UXz7fbkBA=;
 b=Lb/hqbgOsVYONqGKGOue1K5qPmLYqIXJm6fVB17Qyqq07I7s+pqzamLkLtMrMZWjDfxxL9ESz
 6ngD0Z+F5sLBgXFL1oE9q8RRja5Sb8OvOh6qNsZ1MujFvNvmJGqHnx/
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfXwRIlavH+YPym
 CYmFPFiVWHgy0NEWy1rScvMTGWxcdztuFQyzwWuJLMfMbU33xGWL5G9XLXK9k4+Xhx62hvIcGav
 iL+lLWCmrZ0Px/UJ7DlBz9K0t0TlvFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfX4tcCXZkLdyZk
 Xn/k8a3QDEP8s9bmW+94ZdYjWcG/OSbJozEwLgHVoCVCN1g3S9dTAcjhyM/7Vbp7PLrZD3WG4Kb
 6tXMkZDyvg2esLp3oiNR1Z+rQVlgwR/wS3iUG1EvfCmvpU4fjc0fIDBQc4J/CodFaOq0AnfqYeB
 Av1kMTR3PCJOaDhMNwnYLdDaqEx39/HWdRy26FS/MFBHNs0gNCOOdrfhDUCmGa8gESer7hXs4gN
 2hOuNvH0/Fivdmvyze49o6ojMWDC3soiHznqmy9kb2JljDnGDamDB0p7Xrf9RVKmvqG3LUVQZ31
 04IxdIaKujdBIiujDGx1O9cFXCzD5gNH2kRMXIXPBybxxGs8r0UWknydMfqeoEMLrLpgJniRPR7
 3AZ9GcxyxTe4VVH9jLwtiaDDjqIslh0nVTQeH63SG/8FUszEzPudxkB7Fn5YtbGbMIjDpCaaPNG
 DlxUcvBL1hLcosADa8Q==
X-Proofpoint-ORIG-GUID: 5DT7xKUdLw-rnezrDpJMBCxozJMzKYhv
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c21b1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NE1WMI8jZMYHMT0A9YIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 5DT7xKUdLw-rnezrDpJMBCxozJMzKYhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240090

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
replacing of_platform_populate(), and moves the ADSP session duplication
to the driver. The qcom,nsessions binding is deprecated in the same
series.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
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
 drivers/misc/fastrpc.c                             | 112 +++++++++------------
 2 files changed, 48 insertions(+), 66 deletions(-)
---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

