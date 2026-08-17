Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94923DEAC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961683; cv=none; b=Eg3CJ2TkJaXXOvMJtIYtUWHS3XTi8pQjYW9S8guggIHN56EFM59ZxQP8CQ89moGg4eCnOl6tlfkPEc9rGvMam+eyaQYQo6Kvbo2yzAPLeXk+t81xOi04ZDk3XCHJHg3vcYgD2jRJH62RliVspkiRSXAZZQUpeyt3e9qBcLOImWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961683; c=relaxed/simple;
	bh=wkO94JmouNLTREkhPPGAEm7GqQY+zVpvGMVJYEGmHqY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xs8ANJ8B1dw++TKBkCXKZeVSH+EWK9UrX+EXP9aZTu8fzeMopnGpp4I4Lf6fJjx9u9fYloVhqcQVaBZRnXBIKhKSG29E3cVBzk1lBH4qDZQ8KZa2lxI8aSu2ANU2ZKKtb/QZ+53mir9ajxhRPRNJB3OwFk2f5Sy0zAgLqpxJs+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fnOfFObn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZer+ubs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fnOfFObn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZer+ubs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dsOr1861933
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 10:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XlPPjj1P5iTfQdJcc9mc2c
	YpkRVQ1iqS8kqGPOaY+lQ=; b=fnOfFObnSlI6UkDamLngtEKh1Ml6EP2Dqa6KR4
	eQlK5BgrYrqJiV79+9u+GkwbtuSlhz/5tMoRfZ70G/Lwszf3A454MglJmyFfqUzM
	DsqvOfPkUpVdRYhBzkIPANfrN8mvwza0Oph4hU3cpNAsVBSr68QrUuaiDzcgKxop
	yMpwC4yw9UcL7OL56fSfd2gr1RRv6tMajkErZF7BCEgbNCzdvYkk7lWG4PkO7n42
	MJ2WIGeeOL2WyuYdAVuLbddqvg4Z+I/e1Tpm+Vrkb1u9lXtnkGe8WEW+QTzaGJWf
	6G4B4LsAevDI8LATmBLGaXbXvEPeQ9JEkqD+f45ALPgcvHuA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghs3xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 10:14:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so3682732a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786961679; x=1787566479; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XlPPjj1P5iTfQdJcc9mc2cYpkRVQ1iqS8kqGPOaY+lQ=;
        b=JZer+ubsSRHuseLZC+EjafsQN1qnjIk5uVKrYs5XmRw4cFcKkntuQ21pEuhYL5yRZO
         6olujO+3/AcWmtEeZitYTgbg2CnKXV6AI2MAa5KX4sebFMvo3Th3Z2Jkh2iSIPC0KrbV
         IAeQgawUDgfnoUhN4ViUIoltufvK/Iviwt7nMN8FGLq2aVudLZZXMl1MI17Nkmb3op6s
         gDTXFwqOZ+AvybRJaHKyaW8y6nRedjB7DeBws2W8GJwCj+BxU6IxLyl7Nwz8lmHYNGxO
         VzP1lt0IrK37E+rmKuSKpn0TeuxzIkMIqWksOFBz2qZ7LIZli7OxI+jqpDtlPbxWeKxh
         HtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961679; x=1787566479;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XlPPjj1P5iTfQdJcc9mc2cYpkRVQ1iqS8kqGPOaY+lQ=;
        b=g3Cp/W+ekC4W4v600qx5tJPW/3SgnYoLGM+glVRKQsAxHTGMa0AIQUMAr3Gekg2G8V
         vhDvjwhVCovoRW4+LWTyRnhFuuvrNiYFWh3DbdoJD/DEC7D7YnvKqVC2JBcH1XXSXug6
         He2yNu02bGslRnsXc6N17BrwKpDmbeZXXhY+5p4I0HUxCWfBXZCDHcGZMbyGpbgxGzhm
         i/WSqjl6ap4Cbeal3+xbv7dPUkfbDAyXhgPI7GQwzYysfPMwqOFBP3zTs8UNppa6G4Ir
         nRdt9dt7thOqGAsqg1orNR9my9IH3AL5csH91HS0aWqFrDXaiU7/ve+BIDCao+/s9PER
         1Cjw==
X-Forwarded-Encrypted: i=1; AHgh+Rqi5Q8eWrleDyfABZlO+D+n+BjOtnI2cKpEc6ho74UIWKQsdCn6w8QjE0rgW9Ix3p/vs9JgoaXeDeacGLqo@vger.kernel.org
X-Gm-Message-State: AOJu0YzOjcLQ+OO0RQFLGFdBvNqf1QeJDJuhdUCoweXOkd/4a8ANkyNu
	wlbXaHyL+7aH2PLTpp6hgAvIB4uVUrQ80NC3KVWLtkrvSmVaCY6Zju6Hd6unZ8KHHFkWYfrU8NS
	FguRzigbQhSHpag0+NuVZVYkfZqDxW8NuMubmmdLKTm8SI7JccWpssnSA+YchwT7+E+gw
X-Gm-Gg: AR+sD13gqcvb+HZAUL3mboqk9AlPYrAfx+RX+Sm44WkfT2yjNhTMND/e2BjmwuUS7S9
	Ey6Drh210L5x5vLXLBbvS5b/knyS3osLsKCZTwjC7pAP9vlysPG4OrSXbK6Z3BUkwoocmcOMmWR
	nx+wpIBMfA6pDcFofCRcHMD9BANOUvGtzd1w3J3Ym6K0yh6+6KaLQnKPhGb8It2Mm1tAElXGiVO
	zX6ZIkS+5nhhGhgwoL2bi9KuaBAnzG3qSP7umb/1P6rGuKo3bw7w3UEF7AtsMVDrVfFJGLKi/Un
	UIj1WR9SH5q6DNC34MIiOqaQXbkltIIJnopdPH1Ynw1zcJqnIMzZ900D7s/wsuWmt/pGrjeu8Zk
	kG8lafHqakvpW8TE2t6U5/JVn3w==
X-Received: by 2002:a17:90b:528a:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3933b7c3696mr24865436a91.3.1786961679380;
        Mon, 17 Aug 2026 03:14:39 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3933b7c3696mr24865382a91.3.1786961678819;
        Mon, 17 Aug 2026 03:14:38 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d2adcsm1744315a91.17.2026.08.17.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:14:38 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v5 0/3] bus: mhi: Add loopback driver
Date: Mon, 17 Aug 2026 15:44:33 +0530
Message-Id: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnfgmoC/32Qy07DMBBFf6XyGlee8SNOV/wHQsi1x8SiqUsME
 ajKv+MUFUGbsrF0LZ0zd+bICg2JCtusjmygMZWU9zXouxXznds/E0+hZoYCtWiF5LucD1vnX57
 6LvFApHWMIiiDrCKHgWL6OOkeHmvuUnnLw+fJPsL8exapv6IRuOBGBe+tshGkvs+lrF/f3c7nv
 l/XZ9Z/s4ALrDfU2kqSc80/LMoF1hqwUUJUyrlrdt5jxJ/uAFfdsToabJyMoa3j1Q2HPDuMMCA
 uHLI6XCOlF56igVs91C8HXt5BzT0sbqUTEYnigmOapi9mjUgq8wEAAA==
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786961675; l=6724;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=wkO94JmouNLTREkhPPGAEm7GqQY+zVpvGMVJYEGmHqY=;
 b=uNerDlUabWVHFW//tcW5RH/9GyUT/ZoQyyY6AlXtCZfEvoCyHz5FKQnhPejHfjhcK1kdkJzds
 2cHSTPEvWXTBbVyaMoN2n/7VGQjcTL0sh3ElSbKz0A5hUQXqC+LGMJZ
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a82df10 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3A0WO9QBTenhGBBI9gMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX/oON9g5joCF/
 FmOLpdG3zb9w+YDWzGxDTw9XL1eJx9bXDeAVXPXUSbwqbjP4KZ1IF9aYk0eWxxsDHOQbQWA0ZAu
 3xCUEYGlz3t6WwQ3geN9cqcQkqFWFZ0=
X-Proofpoint-ORIG-GUID: gRBj3wgRFnZnZY2f9HF6Avg-Qw1AANbb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX8m1gNtcXaQTz
 EgDSmJGFJ9z5hGXRjlYtzBzqpM50z8jLpmq5PaKWU8VIG2QfOE7BATX3MhdAnAhxr4YFpZIORVU
 pim9BRSVq4ovnf5Sn6vM5RIFxIrlqR59Du/LwqnK0Ej3xt7NrYYIcPOFUmEUOFXut/BSpTAyK8X
 GhpAa4JT/HZemtcR0sOXIk8KcYQXvGtuvl2iUvIyb9TGTB9g1ONubl0Z1btpV7yD86Jl+TD68T3
 YJBJilY+MRhq8FIj929a8Y2S0mZjkmiH2GuGk0zErRLqpNl9Vl128bKxfvx4nHRYapiCuyddsFY
 YvMk3F3qCAL4pWuEr2eCOE1NfSyNBIZacV5mzqD4mz8o29lf5l0MUtWP+q8abZeJYD2yx4g/8CA
 mn3Zd81sCveKsB96IePdIQDoT6qpH2lwsJkxbV08o4/+wcMDKMb+f9E9MYWOFJt4upjmnIO51RA
 tRFx45DVk5UsdVcO5Xg==
X-Proofpoint-GUID: gRBj3wgRFnZnZY2f9HF6Avg-Qw1AANbb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170075

The MHI specification defines a LOOPBACK channel that is already
implemented by MHI-based devices (modems, WLAN) deployed in the field.
The endpoint firmware echoes back whatever the host sends on this channel.
Without a host-side driver, there is no way to exercise this channel to
validate MHI data path integrity between host and endpoint.

This series adds drivers to exercise the LOOPBACK channel from both the
host and endpoint sides. The host driver (patch 1) binds to the LOOPBACK
channel and provides a sysfs interface for configuring transfer parameters,
triggering a test, and reading the result. The sysfs interface is stable
ABI because the wire protocol is fixed by the endpoint firmware already
deployed in the field and cannot be changed.

The endpoint driver (patch 3) echoes received data back to the host using
a workqueue for asynchronous processing. Patch 2 introduces the
mhi_ep_queue_buf() API needed by the endpoint driver for raw buffer
queuing without an skb dependency.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v5:
- Rebase onto mhi-next to pick up the EP flush_async() support, which
  disables the channels and flushes the in-flight transfers before calling
  the client driver's remove()
- Drop the file header comment block duplicating the Kconfig help text (Mani)
- Rename tres_pending to tre_pending (Mani)
- Replace devm_device_add_group() with sysfs_create_group() and remove it
  explicitly in remove(); this drops the !loopback guards from all sysfs
  show/store callbacks (Mani)
- Reset the channel in the start_store() timeout path so the device releases
  the queued TREs before the buffers are freed (Mani)
- Drop the status sysfs attribute; start already blocks and returns the
  errno (Mani)
- Capitalize the error strings and print the errno (Mani)
- Drop the mutex_lock()/mutex_unlock() pair and dev_set_drvdata(NULL) from
  mhi_loopback_remove() (Mani)
- Use ret instead of rc and return 0 on the probe() success path (Mani)
- Validate num_tre against both the UL and DL rings, and check both for free
  space in start_store() before queuing any TRE
- Log the transaction status in the host ul_xfer_cb() callback
- ep: rename loopback_wq to wq, log the kmemdup()/kmalloc() failures, and
  reword the error strings (Mani)
- Link to v4: https://lore.kernel.org/r/20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com

Changes in v4:
- Fix MHI_LOOPBACK_MAX_TRE_SIZE: change SZ_64K to (SZ_64K - 1) since the TRE
  length field is 16 bits and cannot encode 65536 (sashiko)
- Move mhi_prepare_for_transfer() to probe() so ring->el_size is initialized
  before num_tre_store() calls mhi_get_free_desc_count() (sashiko)
- Add mhi_unprepare_from_transfer() in mhi_loopback_remove() (sashiko)
- Add NULL guard in all sysfs show/store callbacks against post-remove drvdata
  race with devres teardown (sashiko)
- Add KMALLOC_MAX_SIZE check before kzalloc() to prevent page allocator WARN
  on large tre_count * tre_size values (sashiko)
- Fix start_store() to use __free(kfree) locals instead of goto-based cleanup
  to comply with cleanup.h guard+goto mixing rule (sashiko)
- Change buf_left and read_offset from u32 to size_t in mhi_ep_queue() to
  avoid truncation of size_t len parameter (sashiko)
- Add zero-length guard in mhi_ep_loopback_ul_callback() before kmemdup() to
  handle 0-byte transfers returning ZERO_SIZE_PTR (sashiko)
- Add NULL guard in mhi_ep_loopback_ul_callback() against post-remove drvdata
  race (sashiko)
- Link to v3: https://lore.kernel.org/r/20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com

Changes in v3:
- Move ep driver to drivers/bus/mhi/ep/clients/loopback.c (Mani)
- Move host driver to drivers/bus/mhi/host/clients/loopback.c; keep
  module name mhi_loopback (Bjorn, Mani)
- Add ABI documentation in Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
  (Bjorn, Mani)
- Rename sysfs attribute 'size' to 'tre_size'; add 'max_tre_size' attribute
- Update Kconfig title to 'MHI LOOPBACK client driver' and describe that
  the driver binds to the MHI LOOPBACK channel defined in the MHI spec
  (Mani).
- Fix memory leak in ep loopback DL transfer error path.
- Rename mhi_ep_skb_completion() to mhi_ep_buf_completion().
- Document buffer ownership semantics in mhi_ep_queue_buf() kernel-doc
- Fix use-after-free in host loopback
- Fix completion race: arm completion before queuing recv TREs
- Fix teardown race: synchronize mhi_loopback_remove() with start_store()
  via lb_mutex
- Fix u32 multiplication overflow in total_size: use size_mul()
- Replace kmalloc+memcpy with kmemdup in ep loopback UL callback
- Update mhi_ep_queue_buf() kernel-doc: note per-TRE callback behavior
  when buffer length spans multiple host DL TREs
- Move mhi_prepare_for_transfer()/mhi_unprepare_from_transfer() into
  start_store() to avoid holding the channel open when idle
- Link to v2: https://lore.kernel.org/r/20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com

Changes in v2:
- Use __free(kfree) macro for buffers
- Removed NET layer socket buffer dependency, now using buffer and len
- Created a New Api for queuing buffers for clients which do not use skb
- Link to v1: https://lore.kernel.org/r/20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com

---
Sumit Kumar (3):
      bus: mhi: host: clients: Add loopback driver with sysfs interface
      bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      bus: mhi: ep: clients: Add loopback driver for data path testing

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  39 +++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 ++
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 130 +++++++++
 drivers/bus/mhi/ep/main.c                          |  29 ++-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 289 +++++++++++++++++++++
 include/linux/mhi_ep.h                             |  16 ++
 14 files changed, 537 insertions(+), 9 deletions(-)
---
base-commit: 9656bcd4c321a799148d00dd830ce7ebf20011da
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

