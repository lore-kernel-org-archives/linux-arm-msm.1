Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585262;
	b=P8sRUf+SdaNU+MqbLM4z6mo++m2jcL3+FhrhSYVFgC3dORQsioyPH4iT3vDNdTHlrNFz
	 BSOOQKFPQyjpmloHuOOoX54OCbXimvWd6H7tljXLI3+J4QS9AwMRu9BxrQEI+WQbOK3zj
	 6PdNWSy/I66GjtrSg+6rFzu3SNza55Wwgr1xsVUmDP3q7Ypo4SefHuNmBA6J1+ALbRpTW
	 8tvAp9nEhtWV6H8EUI3wzKhPuUBTf4ciFXDAihGuV/oSRDNKMktyWRoC8Jwrwcn0iPKw4
	 NNg+jWpH+uoBVdHJkyG1XW+u5kd2h4pUX6a+gyVmBAbhmmJouFkEjoulOB6LQDLIsXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
	b=R68lYGQ3gmRR6ZnUvMMDCO3qoStw6k2E9DQNYarYa+869ZnM9JE0StpcqOywWlPFQi6D
	 U/cwJyyoXA7KvOHsh8E+Nh7VcsDyv4er0mLn9BYl/4+mLqNU1/VjdurFRVw08eTlYEf/E
	 aOyKrH4HL7OSruMyl+qk64pWJ/cC+nEjhN5vfz5FNTYSi93CSRlromhJ6Vb4GqFkN7QET
	 Fga5yEoIo9BU4z7GgKtS3zIoZUCQw2NSeJejKcQd//RJsksHiHOQQcUsusUV7ELiQK6HO
	 1DQ7wdc+aOAXOacii6gQ3VhDLm+WCbEBqTbhEJm85cejm7QRKxbBcxTgbfAAOUEKP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PelQBFxs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zzyu7c3G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC251606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC251606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PelQBFxs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zzyu7c3G
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BMuu2741955
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IWzejzyPNKYwR7KBxWNQzT
	DTG+DrUsU5m4+6TEwipV8=; b=PelQBFxsHMPm0jVPzKeOVLfmIjQrQS61hch6Yq
	Z7YflDt+c6m+H69p9HCzzPbUCAt5UWWcM9foFyQaJfKntQ8HO01P7oPRGEQ5p4bV
	PKrVTjYB9E5PvzkHrEWHWIWZUt6w7JcuTUUtSRZF3GKWBb3apTBXG1Bkjmo/OZG9
	Bhz3gXjQK9hLZm+psso/+A2xsWiLSt3gLbHF4XHwvYSljz5WXZ+vy+N22+qAlj05
	sGYMdOFfYnATyB6VcpB5Lmhiw12UsBcIiJm0d+yTndG64l/7u7a6c+SvL2MZu030
	TpwcOXSj0QTORa8LLdybm2Khe0NIEmCQWEE/qaw02rfjsBQQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsahc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso4238691a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 21:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585260; x=1796190060; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
        b=Zzyu7c3GH1AvQn28V3yjRy2j0bB6HYb5gAZaXmtQriDPZe5yCY/8bhGTkp4WltzWUI
         izCzFAOZR08RKlJ1RZo4ZI4CXxVHIW4ecgND6wYBWegFDg8eGKLfB4IApi42GiejS1Os
         TEpDgFs7hJzuYwtZkAhtqv/ZZAxOAW9rh4IqAvM7ykjIyyJztyxJ9TOKHqf5htAmCDLn
         AJwsJVIoLLk7gfpUfSg4VbpwKkKBkLtHnuyfxl9cEw3JYR/jjBGxmnFm5FZqO/Y1RNnb
         JLCJJAjoRZWMoTCbBEeJYeNZhnCmi2VLNYD1hWadfOHdZB9TCUIWkljtdnHmOTC9iCFS
         pNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585260; x=1796190060;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
        b=EImRrb6LKGWAK4WXEjIccaZeUCWzHQmobfCnnfWjlR4DxHSQdlmue8TtBYqldBBPQC
         b9m+AYl7vlam6Nl+c0po8kmqvLZLyriCCxtuavbSo6dHE+6ChN/pYXpCEvfKpYSckwNR
         IeVXMYCWrkZs30i+I/S5LAM68D5axWAjPLkgC8MyXZ3x+lL9XKpQDDikLPTi3fOibO44
         xHhMw3Dg8++iaAjQm1Yc35QHi4EmJXEsVyQUOhlycEPa/sxYrzDSjUzu1BOAWoi8C9HW
         VP//dGGZ5seaxTqWzmLn0aMDyw8cz32xpja3PKwXbkFVv7yX/2+fnL3Z9kfysCAXCQv2
         vy5A==
X-Forwarded-Encrypted: i=1; AL+hErHaxgqwFBPSUYDVQgGJ9Uk8G1ZGqtZpgHfyIq79fM2UOYoeoIznUSJo36J2vs4ayjzKyT+//hEhet5EIMiu@vger.kernel.org
X-Gm-Message-State: APuU4Z9VWVqyrkQKUfanvd7tYgv2J3BmHQ3IjL/J0obucxfyGmwSO5z3
	uUIVZCtpojTtYi3sbwD3DdKwdNr0v3/LFqRqtU+csju7GEpBEoH1sFL9iSN1hr1DQVz5W5XoxHO
	zOXyXUYeTcdX7MzaHZBYPMLikj/XQJ5+dsZa25mnRkDyC9gt547fbabeFFGknb0i8q5Ge
X-Gm-Gg: AZFdTZd0PSplFzKRxRi51EL9vNpdPoyhQkfnpLlWKVtoGjuUtRN8R5ykg+2S0PXY/wj
	t4LFEX/VbLgFhGtUQgitWvrDiXzp4A0dqVvInwYuGDYMAgA4XgQ1ulU9wP1eIzxpJCRVlK325Yr
	fyHxMStxiRMEm3Hf7kkOFGcV0KQFylHOtzixq+6sYAYkHMzqjXtjiIg+RGrQm75lThuDb2iEIXY
	PMpTelH+8XdzY8mm3THmshOTFij+6hMBjoOyUBDvSltaG7dzZKsQ7lGaRE5CyAlgFEtshK7+AFA
	NTuPzw5AdOGz4hH6oMvwgNzAOkUP10SxCvHw0wBKl+ajU06QRNS/NY0keCVRGniEUrnzkmg7gp8
	D+qswvIhmbq0T25rJOZyICh9MqayfcEXLHuchJPbDRYvnYZ4knA8k4pxcCH+Bhqw2fe1plYf+vN
	+z+56OQWA=
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15040178a91.25.1795585259582;
        Tue, 24 Nov 2026 21:40:59 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15040158a91.25.1795585258996;
        Tue, 24 Nov 2026 21:40:58 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm28897957a91.7.2026.11.24.21.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:40:58 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: iris: Fix issues exposed during decoder seek
Date: Wed, 25 Nov 2026 11:10:22 +0530
Message-Id: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMd0BmsC/3XNTQ6CMBAF4KuYri3pD6C48h7GEChTqQrVDjQaw
 t1tcWFidDPJy7z5ZiIIzgCS3WoiDrxBY/sQ5HpFVFv1J6CmCZkIJnLOJKfaPMoGVIkAFyp0VYg
 sl3VaZCSc3ByE/cIdju+MY30GNUQjNlqDg3XP5Z/nsfeH9pwyqjQ0mimRbwD2FjG5j9VV2a5Lw
 iDxgxcfg3P2ZYhgCM6arUq1krz+Yczz/ALmo1MGBQEAAA==
X-Change-ID: 20261031-fix_dec_seek-2fa92563b495
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795585253; l=1626;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2+EGv3Dw3R5Ib5DU2qEGLXEeWvVqzP+A3VmzdwAXxgM=;
 b=PCZKBNddRv7BpXZ8ccxWSOVBequD4bYshmluZJ305PfekzAESPiv3PccdlmBmClQSEm510zDh
 RH9O96QmuaPDr+yDaMuIW6oTkDAoetWoIgitIE7ELA3faZesFprXI49
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX4k8j/uJy0zv9
 24pzs5xlvVyRYJdy/1BO8EUwhv39BtAKiXu/5mYWCzf64/4bT7ZEygT4WkKqH3jOgzx33Qiz+JM
 /kbIbZh5ONVoC19HzihPPGn2mH84u2kHmh0Pt18pl3bykvVcCYNrmB5jDxIbvAtdJf7Oy7hO0iJ
 2S3/jO6Gb2++V6sS31pC0VbjQdZYFfdxX2mhNXpj4J/PVUGPcxcFdSry3YaPpZ2cEz3SyHECoYx
 gnmUgzvgdPJIz6go1EhoMwrYkDxmm9aHvmFNzFI0dYBAp0CZUiUELXKYbQ03t8ssOMUrZtQDM2W
 t44DMUhyo4CQ/b79RLLuES95hQJkoAFhU4ud3gGojLsW/Asgm4HNTNjUfT8AcHscwiggIbKe/Ds
 Q5mmEKdSbXd1QFXIyYc3cpqOPO4DzkXywoUX7YUebtb5JJkddL4SrTlmrrYG68+TxVLOEw6Ee+P
 WZIqQgtx2P8nyjH3KiA==
X-Proofpoint-GUID: JeLGIwPQJt8Q2d9l1FWhAVrnF1WHXSAj
X-Proofpoint-ORIG-GUID: JeLGIwPQJt8Q2d9l1FWhAVrnF1WHXSAj
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b0674ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX8VyxthoMwN1c
 X7lo9xjQhqrx6j81u3TLqdbdbcU5EYZLP9D7pui1tx3NUjAYy1j/o88sEocSu0dv06TquzOAnUF
 qYpq5HDgi4RNXVbrFGSfEGG4Lx8SYfM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250022

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Updated commit descriptions (Bryan)
- Dropped HFI_PROP_TIER from the AV1 input config params
- Link to v2: https://patch.msgid.link/20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com

Changes in v2:
- Dropped the TIER_AV1 cap instead of removing the set callbacks. 
- Link to v1: https://patch.msgid.link/20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com

---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 11 -----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  8 ++++++--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 4 files changed, 8 insertions(+), 22 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

