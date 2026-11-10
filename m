Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319904;
	b=qJttXPcbjVO0YNKkZ+waM24BZHEa5gjwOMMFzKNugQKLriEWvfRCdzcgpk9Zs7GiAsVm
	 EipRY+uvfTK8CpgN4oYRCNy+difGR4fnqbQiKsqIH9YV/bJMPOFCVJb2XKZ6dHpcd3x5m
	 RehKUUet7NI13wg/194scKMPXRZLVblWdAatWobq7Kf/Hy0FJtRiX1/OB6wKxfShO2eh9
	 p0dNjuBLE/CFnQscLvpYEKYS+7TIyKH6HQyZDRJR9jL5iX45x6p4W+zOVlCy5mw0y2isH
	 k+tJ/hJfnN7iS1hfPWnp0dn7CDDv4LqDUu7ABE8k1cEcF0T/adP1Dy/VZLOrXJNnNzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
	b=FvvH94ow05W/cs/ozv0U4lCgsIDWil1/6crmr06JVQ7tAqJcKE7sWyWSKH7OwD/WlHR0
	 FRVhMOaBDSqUODPykP98lDqon+tneRNOuUkU8g1d15j4PvHMVTEwYhDATDgvuCYSmA+eO
	 Iu80J8n+4F2KPfvlXUMX1NdDmkEeoZ/Sl0mu/wljaZZgKy94MLIJ4gri201IkI6Jar5Sb
	 HA1fDweWwjywErT7tNWnpDwmhR1x5eo8wZMLcqy8fHxOTZTDL5b6g7FKQnQ7Iulkmv//f
	 WCUCtwRtTUP7+OyZ5AD2TYen4Nr1EK3UwpgJA+/8A94fJ1d1G5uBPY7KXC3/0kyX6Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eC580CI+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbqCjKeG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BCC606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BCC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eC580CI+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbqCjKeG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAOIw1599664
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=; b=eC580CI+EfReaL+K
	QVb4jwWd8G+tjsJNPYyO/K1YKgPfdaAd+mUba9LUy0qDatR7/JERJ+CpZKHuT6le
	D3S1QRhu6C9rubOoVWoQpySfKI/KPzkJoxzpDBlDDhyYgZ+V9/0XmIvYn1tpKk5h
	YKAZs1HAB3Niyac1D9d4D0Dc3MLifS1ASJq7XzvCb9t6yBDBPb5I29TElU0nWsqI
	JylwUMG0RCoUgxTOCRRKbbvpERLmhT63ixMGF6PDCeJHcxLSD9mhT2ZNOL7ygZ+R
	n+eI3g5RA+rCzxXPtZWxehp+5SCVCxqTdzClXXKIlwGtiK8WknnDrTTelv5egwTa
	XJwLzQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4ad4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fa5673fccso4671184eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 06:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319902; x=1794924702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=BbqCjKeGZ0pcVXJesBI1xFCKKjx8KFD9GzDZCet8pr4ZlrJ4QOVtYzpxDXVG1c09DN
         qltIxG//z6Ck+cmlMGZxWC7eJfHkjlTfFnqRWYcOeD4ADk5oYCWYu9U0IvrU2a6xESae
         JFZ+/wDS6ojSqq292YlYXdHNVRRINiw6QAWajsnhekl/QnfOv/MJrPcyXuEc5KsXb2I3
         7js0oJYj+znh3fGlpB5gUTUg/AE61UoipdqLYD7NTVu1Fyqs+VofLiobhA0C7I+Md7V4
         DQMFh1x5e/ZmRBtAFgG8k0O6jneK/71CEkCLr3SMYbrxX2NRszE3L9Fxw+jQDRXSH4Cw
         RFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319902; x=1794924702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=nZ3SRKcEzzAOZZ++K62DS2mP9Atnr8Q0Wxsq5BH/plINDT07yullfwazziD0ktWZAc
         dWSnWLj7i7hNmcxvjPhnFBiEViW5Hg0RVR3SIuMj3CrKWIv/SWWwRhehAB0Zm1E6rLlg
         kNXrsKhG5kQenPGdPIwxItmyscNAPhXCmUrm4kD4da+E8tnyeCvhTXfU5Hcwimjf7g9a
         kuJTOR3tZ3wcnYLmYkNw0U/A1oX49r2axsP1vtZ6BdvTQZgSNA4alNWhBHLq24AH7VVd
         HBXTjDqn5GWQvxSsQFGpgZy2mREG2mFLRY6RbIVHLh6vE1h5J4Sss+8WwLefV9KbT7GP
         7y7w==
X-Forwarded-Encrypted: i=1; AL+hErG7B4dtVcV1GHg1U0eDN+252STgC7Is92XRgozgNV5QQ8SifR6HlfdDhvLB0tnXmwD22hkcT+CG98OfmJpM@vger.kernel.org
X-Gm-Message-State: APuU4Z8nhdqtOQfByM7nmlX1IXyE8PAincqx39m+78OMHtw0jIpdoFPm
	vrcKcfZgCYzjPiNqidCw4p85CTB2bTQ04RYFEo7LQIwFco8gTJfZ29MZb2E/n4TaRO1PkEPMkdc
	Ll44yu0B1iBWg7+uVF5zqyPsbP+BPT5HWSuwre9I6SKiAelxLuInJ2nXY2JuQoWsuMGzJ
X-Gm-Gg: AYBFou2Uj58Ine8lunjaTrQ2CCJdRk5aoqc1DLfp8yAzHfS/Un/jDfCQKv/BJZo4j6G
	m1f80A0GlFa6wMYV4EN1O7Gxtpvov/308R6U1otzsPWWzrXoWvyoawVNsJ9xLqzgE4MiMzVYeTt
	I6O36gVQW+4d+PqU7iZNfvF2P6rqFhYzo9bxz/PEYHFRTlVQoF3ZDajVmQ9oA4feZ/5TlLuSUiZ
	hBM5nOpFR65DX8lb5PtcegyrNUHOk0Px3RSNDZiX3v0oSrULxsr+XMDCKIJKS4uf3G2SQJsSgRi
	Ja8MXjFtYT6JrLXOxrDhi6VIM7e4Yu+ByKpY7uqY0DReQD2eeXOxATomqz5f475X68SE9G1BUUs
	8qJx8ngJ+4y3dVicfDwBbqyZGA89N5nsV1eKkaU7HXCYNdk8irLNCGK54EIesp+IH/r3+pxTz5o
	9S8QU2qUs=
X-Received: by 2002:a05:7301:1a0d:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3751e6ad1e0mr3517227eec.8.1794319902059;
        Tue, 10 Nov 2026 06:11:42 -0800 (PST)
X-Received: by 2002:a05:7301:1a0d:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3751e6ad1e0mr3517175eec.8.1794319901113;
        Tue, 10 Nov 2026 06:11:41 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:40 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:49 +0530
Subject: [PATCH v2 1/5] media: iris: Fix runtime PM reference imbalance on
 failed resume
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
Message-Id: <20261110-iris-handle-unbind-v2-1-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=1181;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=uA1DrNWOT1xdT5YBsROagD86Vd8Mo/RENc8c8k3PgK4=;
 b=FyWfMZv+1k1zNofMJ+HLQJe8BENlNDsQx5dvjhx7AKhywMc470zwo5xpeS3NsG7ngqswsEnVF
 PajrSZ6M4LyB/ckJfR0fAbrL4ygIeerwh4Q9w0BOIlywc3c6B/5lBSz
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX7Gs0a1qIMKwA
 RKLkScUVDkI7PqSX7APD0BfjUma7VF1YNriybVRK6u+LFQ6ke9+zIeeCKkOO4baqERd2c51we01
 TFSRUjffrNBWHICkbfdx9bGmA1HI0lE=
X-Proofpoint-ORIG-GUID: 5IcHWmFCpyUsDeXz_BaQufaLd_U0O3rE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX9TjluTEVA9Tm
 xYF3PhUKzH7WbLvxNrf1slBtZy65mm7MevOFSIpplx/UGu4B6uq8SGpquDTU3qdoB4sdrT8rR1E
 PNp4NVa/Uf/JsV4koRoPnSGjTg1oqTRdlTaQbvcc/e80sL/tX0Qw5IW66BQSJYzNLKBLvx8XObR
 CCgZa8saWlTeRTgASWvMYO6Pcxq0my7EuRgKpXfqMPrTee5wGhrAqzDDfRO7/UtAF02oqYhlc3f
 sdxOASILtNoAxzwFClfPPxJIybO4lK1o7QOfCse86UIchQ5d++fd8OrA+Llngk/KVnbVlqWih9y
 6Bt5SGYEv0M2+kA56r6LxQEmQja3bzcxjU+13CQEkrBBmt9whni+u4nveuG2tXyVDO5TmQj+2+L
 0pq9kebAxao5m9KPuN0EKvoCHqtV/eWbKa+rnvtaJXq09xCMfoekk+MELfn0eAxQnSt2+X1uqe2
 27cJii466EPC1KAruhQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af3261e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ohPow3cFOKvdjjdYMLAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 5IcHWmFCpyUsDeXz_BaQufaLd_U0O3rE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

pm_runtime_resume_and_get() drops its usage count when the resume
fails. iris_hfi_queue_cmd_write() dropped it a second time on that
path, resulting in a runtime PM usage count underflow warning:

  qcom-iris aa00000.video-codec: Runtime PM usage count underflow!

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e21..545bbe75e1740 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -132,7 +132,7 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto exit;
+		return ret;
 
 	mutex_lock(&core->lock);
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);

-- 
2.34.1

