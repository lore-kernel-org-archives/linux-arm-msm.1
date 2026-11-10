Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304701;
	b=IJMaL0IlMHy63s1/7eyysy8OeC7HrOoQwEOpEzpyuXadEfD4xcadbbaAdc5Um8bKfzth
	 ZgCvu9JpoTpR4t5rsR7pAhfmdQHQRK49aT+t3X0LKnfcoMXI5iAot+9VGIipXKX0yi4Mh
	 ecRxygRC7h/RVv+W+/1h6E24RA1iO5OdN9omFUofYF51ePUdczRzMM6b90Cl2knhFZlU1
	 S/4ZgwM1WulWZ1mI3Hc/ug83zxesq2KOG8uy3d786p+vUFUmCOz6XASWQA3SjU66xi0CQ
	 vzPGUNyEuDIZrqs4mdeJwJ3SUqcpqWV2eqIHcjq3eypLD/v0Iool3/NQQnozwscLdGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
	b=2BrnnGePHWPAl82/l73KCRXkOJPVoooJEI3Wk0BWHYRhGBgJ+leLYCK2vBnqhh7lxBl+
	 ZVBqr6s2L35xtvYbJol1q12sZ6fpi/3p8p8PxfYjGqp4qxUyLT5m4P8Bc/NA66lI3sDxF
	 wJs08DCOfaWIEB0DNC0+nVzeDAlIF5zdVFss/+I+azgrKHU79zY689Dtj3cFTLtG5uYtV
	 V+qZklCHMT0LvF7UI1JD7Q5G0UkFgPablSRH+rP4S05VXaS4u61oQmsFlXyGwAJOeSz88
	 16Pn9FzDgOwtpZjuN6iCEjd+eilgJQumtJB/sy5vZuUIJG7Gs0mikjPAa0PmWalP2dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJ+9Xxz8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1ouXujT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8860A2621
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B8860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJ+9Xxz8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1ouXujT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l6Hf1681497
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=; b=BJ+9Xxz8F01ulYxz
	Q82Rgc1TLeuaSLBIHQQNL/D4L4QXiskoc2JiS3ZpiI7i4/VN16CqbRxEkZpkcgm8
	Vl1q34xADLUNWgC0zXE/5Qn+Fa8WM073mrE7ACJumvVjiH/MQ3x42jMjC7m9oCJ1
	24VyP9xr4D4AfFk7yb3jUQSzh9PaVfYsoJbrgTDJuhgsMhnBveHyqqpN1D8POIBc
	JGhsOll/gl/GqHW8L7DZUOxrsy0YfrhClZIu03g5H3wX6cM52siIhQSBOmsr7CMd
	jMKYWLLFTj/5Ucm6PyqMqXodNu2smj/yHoCAR/XUFUGln3PbFAgGeaUDT+WifZDp
	kPRs8Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkjnp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso2577623c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304698; x=1794909498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=e1ouXujTi6R0XgJZej/Sfp3ezhx0C3+WhzAWE9ztVzapDJWB8U6PlBnAXnXT5S0jbq
         FTQWUNEkQUNGEajqfFV/3xdl19wdqz6xW8eQphUH2ayalffAt4tNEo0kBMc9eaauEDKo
         fvKu2QMZVojCDvgpSIVorlyr1hRqSqwEMa4KX/+mDgSqwQ0AapW5LnKgSQ0gvq5juhmO
         3kRbLiI7ipMnM7yFsW79fHoWBZYt+/wbGlkP253PDfkujQQVNorLuw0FJCo8FDfKeYnq
         WHA+YX42ZjV7O06oPrmfp0BG6thSCSCz08RobaqwHw6+8Jp1yh++9qVRHoMS7CROVamW
         IwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304698; x=1794909498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=GGBR5WNF9gfy1WH3R9TD86byAyFtUwPhiqLWUBpwXJssrbgTiJJsCvulvFECqI9xOa
         NWkbauZSAw1i2v9yQBIAgQ0b5bBHVu0UlIjlj46M68DYGQbIRwBtS+/jywfiWa1YRceJ
         A1/Kp5F6sik7K6bIHLAV0Z9VyWVzG65YLgdEhxwmRUpuK4B/GQ9QzJ0x0PE48nDrzdBl
         7U7KZ+bm4/dXFN/SV6PkvBEWXoBuedNJOEPe3sgU5jTv0qAHCPXk0J/c43MdOO/jEOfS
         7eqAv+Ep/9R7z++OGgdRVHXZbMs5pR/anDbCoHbVx87NOgr7s8xfUlu7Exx0o5iE5ESw
         576w==
X-Forwarded-Encrypted: i=1; AL+hErGsXnJuAODI4uUV4cC5OSEiWQA/T1Sn17kllCU7kinRGEa0Q2Bwd1wf4adV3MWlOd2UfpAX/6nqu0ZAx843@vger.kernel.org
X-Gm-Message-State: APuU4Z9hAVDLWfJHAiBUlaMv6B6dTCGEESe7NjBjIuTf8I/bU1A1dcYp
	IFZsBJSXox+bGmuBYGnMfr/5mIo2I4s8A/L6jQW+OkEbxa3bnU8k9ICEU2XCvbeaaxgy2IkZvPD
	jb6JIHr0pfoN66BsXYL7cX24+guKTJeoCR+EiV+IBpo8za68TmMhzFkuEn7tmAwtZF+CZ
X-Gm-Gg: AYBFou1/+f2f5uIICwrSIqqszS2Og+A7iGzdVowJ7A4KqVBlhGnsrpvn2RCf6cHPQt5
	mZ5BP0P+qRltoOU11pzWh4CbFdrJ86sb8UhNmdPAmg3vEFgd7yXn74o+WtqWL+2IeayA4Ik/5+n
	MiD3yKmdxz/irwJdpR9cqxnvV7JZsqLUCFTN0pIojJEOWHCe+aE8ddHrNeWKdWhsOimaoaX0If0
	G0qdi2zk8S9U+2ZesMOadUct71eVDrhxIqOm9ro6BEH1M/PIcRuwfDYFh6L2PdBDwxf7ZdamKXz
	1wbHO+L99T0fzmXjcBy1/aF7A84M6Ed6ksXTBDU4f8GhlYgeua/aAuMl5e/SsqlpHcopwNT8vhz
	bKlWf4XhCJF5tXNOpeB5rJvUPsI2pF9FI3gEJpuF7xTDftbwlnoO5bICxGdD5+xyujaEmGK5/Gc
	ttgK+kUg==
X-Received: by 2002:a05:7022:b90c:b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1b3b607b487mr2969489c88.26.1794304698386;
        Tue, 10 Nov 2026 01:58:18 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1b3b607b487mr2969461c88.26.1794304697646;
        Tue, 10 Nov 2026 01:58:17 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:17 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:13 +0530
Subject: [PATCH v2 1/3] media: iris: Skip redundant decoder input config
 params
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
Message-Id: <20261110-fix_dec_seek-v2-1-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=2308;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=J+3ZsNvdFp2OxHwNoqL05vud6cfNJiFhDK7G5hBgPFY=;
 b=lzO9FTQ3kd/3K/7lj8dJx/QiPKGwZwGTzVEkzT6ce9a77Yptt95uDUNwrV9TjLHmHQ2lk7HyF
 IYO9duH/L20AtQPaMOTJv1qn2rXYQhYcz0L1XVAs/hXh/jhNj31BeQZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: v19KXvGRbkAd04FBCJffSIR1F5WYCURa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX7UuTEQWC3UL5
 vMRW5oUhbp3veWaPsLBH+GjNIls7A7GElr/vo4ALSYP+Vm3TPo9h4jqeBzcswQhITD9afCLQrA8
 UwhGHk6wzgBzODZVEXTVbBJwBOjFaM4=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2eabb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPfzbt1C_6B9HWAkqhEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: v19KXvGRbkAd04FBCJffSIR1F5WYCURa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX7CImdpnJAROv
 jRYRrzcrykYda+ZTHO84JF3dwPC6vxWpWOCYBTT6QVHpC+qrvyBlMOd7/VlRtNIa0mXT8cT0UXa
 fzC9SUDjkda+gF6a7KhV33da31woRrkEijBIhHFCQy1CjFJUPzUl2/BNiMxBMYgX04aqCMbAdtt
 u+CyI8CP37Jxc2yNRxF8TaRPSUWBYI9ipaSExfE9bCD3lP4mIQBXH8Yf2R4JWJbFJRySpP8UzFo
 XK4MGq/DCw9WmlQkqoAKGlUuYoUyHGe0LPhJhtb9ITALKMHefuXG0zFJLglNjyMEhu4qeqF5vJQ
 tsjRK54zbItXl4aOEKflpssm96nuUe+HIMRJArWA5/4zO+wLkatF5pubBATnKBum0LHf5lStUQD
 ySErzCCCjyfuBZFdBp3RWvCO2Oadyd5YsNwnGRRzDzhT4DxjhmEg9eOx7aSQBS6ePcLwafd8yS+
 Flf5MOGPuO+u86UGR+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

The decoder input configuration parameters are sent to the firmware every
time the output plane is streamed on. This includes streamon after a seek.
Resending these parameters generates a port settings change (PSC) event
even when the input configuration has not changed. The client then
receives a redundant resolution change notification on every seek. A seek
hang was observed when redundant PSC events were generated for the same
configuration.

Skip sending decoder input configuration parameters once the input port
properties have been programmed. Reuse the existing ipsc_properties_set
state which tracks whether the input port subscription and properties have
been configured. This prevents redundant PSC events during seek operations
and avoids unnecessary resolution change notifications to the client.

Fixes: 025398e9121c ("media: iris: subscribe parameters and properties to firmware for hfi_gen2")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b..fac61ece177e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -668,6 +668,7 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -693,6 +694,10 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
 	};
 
+	if (inst->domain == DECODER && V4L2_TYPE_IS_OUTPUT(plane) &&
+	    inst_hfi_gen2->ipsc_properties_set)
+		return 0;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {

-- 
2.34.1

