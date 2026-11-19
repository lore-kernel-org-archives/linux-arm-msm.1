Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088760;
	b=YT4fDoyVDhjNIzH/at4/FnE3qCE+e1P1L9Szi+2blNNEqh7dHJf3I/1pA5YquPzw7LvE
	 gCZ/TpQBIrHPcy9UptzQb1zWVY55fyVE911uXGFT799jQa0388zNlx1t62pSHlWsFtmBt
	 T5ybUBo5xardJY3B0ZmVY90ZgOS958qRKEbU0IMbhRdDtrjMCDi9ZIn/CDc4GDZga73dQ
	 6JkemCCVmhISgV3YtkwsrpQuRXKlDKQvK7hk2GF7H1nDV/TphP1SS6d/f1hBy9QKrOjp8
	 SF98ATrRKHkTaLpOLrF/Xnsk4sYI3oY9hdCfh0OsclhzdyxD1zfWhwC3nlJhYIsIzrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cl2K1V+C1GydrvsfniG7BfW1zVvH/YWUHlDDFm15Zm4=;
	b=zOoDTfpPGJ8kYyLkgRg8crL8vniniQQt3GIO67Iw8R6kYdteN+cY5nOhm/yr0iHFdOlC
	 YilEpNmSLv7sJ93tbQpH6oo5t6tNQfXQyLuA6QLtjX7zYFw/WntEhbbzUt4ccB7zh5U13
	 x8oAly/C8jHuqbeVGjIBGUPHBXxQ1h1yga9qeUr8O71d8MQEkUzUWRCkbCsZL5nWRF8iU
	 lzR3RHiREQIi6n5U2FYILMi9CmG3WzPmbOUMzLBgWttWurp+U3FNU7vaX2LqHBUyP5zE4
	 /rudbD5Ni11KfI6rWhTxdHuJcxKV8YR0mQ947hKIZy9YSq6KVuVFC3VYRCB9HC276jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=os0wq+nK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGLaGV0G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70966606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70966606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=os0wq+nK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGLaGV0G
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBk0b32179570
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cl2K1V+C1GydrvsfniG7Bf
	W1zVvH/YWUHlDDFm15Zm4=; b=os0wq+nKvUOWxHdg/7HlQyP3T2DhzMkL9h21Zf
	6FDiIhePHOdDBwsltzVGClNMqFrK3m3uuoMP7Zc8pw2C9fgfojgQVQexpEIf0Mik
	AzbZCdEsUd7NRDXxlK7TJdIE0ZRm+NkF2N2sRgln2zC8mLJjKPC4nBygTTf13mK7
	JD5w+uLEjCywqgdbU8Q1J/6SBVx6oxfy8JC7sm5qwKbQbxLKjvFtXLUyAS6q4kKU
	gP9PobKfUkXfkuk9Zu0gyOGygUfGXtyzWH0MmVlB6VnLsfGKYFYUMP8OafUk6s1m
	f+KZGfaWZRjLCw7Kdfef+UCLc48LpLYWQVuOVslYgbaBVdqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yx68492-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:45:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so2099861a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 03:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088759; x=1795693559; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cl2K1V+C1GydrvsfniG7BfW1zVvH/YWUHlDDFm15Zm4=;
        b=RGLaGV0G9BqZpfILaO7XjweZ8ZfmP++nY+XetoHBY8vfdcj3Se4BrOww7H8mRSPBt2
         1zH2rFuu7vydn2nnYARHGylIIvPnRaEWpargcQNvyTMovSpwy9I5v20c913WAwjiOkxn
         Zx4Ah6rxrsS2jG1SA9ZR+5BdburjFoMkVDXPhR+6a5mOq6qEtEOGRDMFjBUcw4qRxep3
         rXyswispz/67+pUzRtdHmZpaNddERfy97Lr46B3Ky9GYo4iQmVXe0mAI5sF/41ajEs63
         ZU3bdZ56+qjTHHwwR4nZhplrgoC5C2zLp8IItySeIYjbvKkcoorazktzlQvMnD2uUkBW
         RFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088759; x=1795693559;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cl2K1V+C1GydrvsfniG7BfW1zVvH/YWUHlDDFm15Zm4=;
        b=EbOueFjhROuYy2FiiJVDvV3jffA2JyKTQyV47qy+PFdyvEqtdHkDRm/I+gwpsSwZ1n
         hoEl3uDw1hWoeKekgvYecMM6cdmBCsc9y9Jltu28P2Jz8K1yb83TE1gH02Zt/xlDYCUU
         TljFW2x+4fu0+eUj/cggRADyLMpHDA1CNkJp4K++CWKwzJ8klB8ZD5txfipqXD2eAh/s
         aBc9pE0g4Dwn2KXW7H8XhFVwaTtHZQJFVqq1WTESmV6fuPMsBwoLVe2JS9kQe/MXpnv8
         v3OnTsgx9yt8OM84SMrlQIKaHLmvbB8E0hUxVzNoM5kB0C5847hrqpbRDZY9Eu8ajEHt
         SChA==
X-Forwarded-Encrypted: i=1; AL+hErFQcyYqKtIWLdO1O517ijpKueZEb7srOV5cqPL2TPPszBUGvFiwp8zwUu8NngYVDmEgdVGYJZ0DM1DZMhSg@vger.kernel.org
X-Gm-Message-State: APuU4Z+TQtq/MB6DeyXwkpMIRQIKQ3Tc/uexLQhx+qCr4epE3dJMdXSU
	Q/1cYt534cvgpY2uEs7vbJBo6qIPBWLX33OAUkM5ytaLd/FROGyxvmigEzOweKs178peQMW+lEa
	11D0bWkZ9gpt21sn9iL85id0FprYLjylIKvIMA40tZoJqmtOQVL3mtfp/Gl2vb0T1nRpE
X-Gm-Gg: AZFdTZd5oszyp4FpgNe1k+HB1hxT0Edk8jubI3IrLCzWkeiMKKAzL+L/+X+P2lFXa84
	QEu7fBnxrbGhaRMx9B9/T0tgsS0JG4pluUr5IuQxvrskBJWzzpZo/P5kpZDQ/9Ljj6no2J73pnH
	cCkUb8+pP2ONaqIJBKI+wHvA3MswyYPrvKLcccF0+oHLT4GooCavLfukJlAaP2X6iX1+JuSPwaC
	xqXCU7NFJ4coZ/Oc+1oh0gKCl25CZ1ByC25t2NBilapCQcv3XMmIysPym22q4HkeRg6+852E3V2
	0GYIyGgtbCosgfnXF/USXLh4Zg8XQyQ3zl5s3VS8jZ5IWDnehV32mOsIspJ8kqt7cJQxgrcL6ra
	hrwWOKxETNusbMGylP09wcH4lU3V9/lR3dS4Ex5W2xhIGz3C/WIot8RKSipcZyQOnUxU7CWwNdW
	iGzJSrEds=
X-Received: by 2002:a17:90b:3890:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b3d07b032dmr5632889a91.49.1795088758778;
        Thu, 19 Nov 2026 03:45:58 -0800 (PST)
X-Received: by 2002:a17:90b:3890:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b3d07b032dmr5632867a91.49.1795088758281;
        Thu, 19 Nov 2026 03:45:58 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:45:57 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v3 0/4] media: iris: Fix issues in the driver unbind path
Date: Thu, 19 Nov 2026 17:15:29 +0530
Message-Id: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFnh/moC/22NQQ6CMBBFr2K6tqQtcQKuvIdhAXQqY6DVDhAN4
 e4W2LqZ5GX+/28RjJGQxfW0iIgzMQWfID+fRNvV/oGSbGJhlAGtdC4pEsv0sT3KyTfkrXSoSih
 KBChBpOIroqPPPnqvDuapeWI7bktboiMeQ/zu1tlsuUOgtfonmI1UsgB7ceC0xbq4BebsPdV9G
 4YhS0dU67r+AFDEpzfNAAAA
X-Change-ID: 20261013-iris-handle-unbind-fe09689e6696
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org,
        sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=2349;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=/P2Y5/7trPmYQVLg1UXQyZX0w+9QilRr0lKIvkPBL4I=;
 b=hI5HHtCMwWBWfndFvyi4JmCSexNKPJH8f92JgZvqylo6fwdxs7rwn8DIgeMb5h4Cvy/ieWaEv
 pRjpuL1CmhUDoN2TZdiEhJqKAOihI4188iUL/VfDrsZubRsC2TSjbn4
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: F4o98pp48ZMJnM4bqbOkCZpm7ISbOcKg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX0cQDnQkK2BQt
 5j2uIZimvX7qL/F3IG6lcxu9O/IDFFu445G+TuMFSBzuZ7OX1KphyZTTKcQmxBs0s6ruEsmpkgt
 9vQwl64IfbYcCTH9Slc32BecvisHk6w=
X-Proofpoint-ORIG-GUID: F4o98pp48ZMJnM4bqbOkCZpm7ISbOcKg
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6afee177 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=6I88XT8292Qb7oD-W5sA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX/zMGUX+7hx08
 cyS/uB5FKmCx/AlcJ1iVGIHojFm9p6uIJ4NGFTBvAxGx+kjMeTX7W4rWdm9dxIu7oszlBIwwgKX
 SsyuG+9iDdbXHDFfBoFzs1PRPaDZz6ChHjo/48MVWqZI8y5vMvSpIsgFSxpXJqBY3Vjf0zB7/22
 JK2+qvqSKQkDjCTqlTHylQE1lREV/rN60JVhCMbS8lcc8Nm9xRQ+JU+g2WDmMLNKkKKnaGQldOK
 WzgnsSKdPSqa+u1F0NjT1JaC3FJSsAcgtIRb1185ULFyIobqkuVXpO4NXjWfiCgUVwweyyjp18W
 RjVew30mY8m/TbVezS7r9AZpcTlYCY/Jmn0d8ZBu/Hzw6ibuSJ2rQjjKu7K+bwXhbcyYYvwXHUn
 cLRsExS3dpowfVdVQCWJGCr+kf2JApzURK9uXdOmzs8Xqc9Jjb4kiQLZ/8U0GG8F9+ESIEG35SG
 a8QAyzn50I0KcNNBjUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

The driver unbind can be triggered through sysfs while a client has a
video session running. The devm resources are freed when the unbind
completes. That leads to use after free for the running sessions.

The core and its device are now kept allocated until the last file
descriptor is closed. New sessions are stopped as soon as the removal
starts.

The system error work was only cancelled during the removal. An
interrupt could still arrive afterwards and queue the work again. The
work is now disabled.

The runtime PM usage count was dropped twice when a resume failed. This
happens for a command written after runtime PM is disabled. The count
underflowed. The reference is no longer dropped a second time.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Ensured that runtime PM references are dropped before driver removal.
- Dropped the unnecessary interrupt freeing change.
- Link to v2: https://patch.msgid.link/20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com

Changes in v2:
- Updated the commit description of patch 3 (Bryan)
- Split the interrupt freeing into a separate patch (Bryan)
- Added a new patch to wake up clients blocked on open sessions at removal.
- Link to v1: https://lore.kernel.org/r/20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com

---
Vishnu Reddy (4):
      media: iris: Fix runtime PM reference imbalance on failed resume
      media: iris: Disable the system error work on removal
      media: iris: Fix use-after-free on unbind with open sessions
      media: iris: Wake up blocked clients when the driver is removed

 drivers/media/platform/qcom/iris/iris_core.c      |  5 ++
 drivers/media/platform/qcom/iris/iris_core.h      |  4 ++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 20 ++++++-
 drivers/media/platform/qcom/iris/iris_instance.h  |  2 +
 drivers/media/platform/qcom/iris/iris_power.c     | 24 ++++++++-
 drivers/media/platform/qcom/iris/iris_probe.c     | 66 +++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_vidc.c      | 20 ++++++-
 7 files changed, 127 insertions(+), 14 deletions(-)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261013-iris-handle-unbind-fe09689e6696

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

