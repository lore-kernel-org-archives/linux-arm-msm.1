Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601977;
	b=INsxXlCWRi+UH/tFntRfKMwj0VacsUMCM1oNkHu3YSDJbA/NyZ1Decfq1rGsmk3eOka4
	 DX6hJECwB8vnvY4X8a2vBSYXxN/O32ErDAI8QFSSih3TxRfja+4uEFdOelX7ETzKoFYtj
	 NvxX4HGfHJ8Zkr+HY3QZ6fzLl64d5MK6phKw+/csSObCHZjXtEB1/9/I3ZbSDlUBy+R6l
	 ZE+tI6W8FPsl2othpcku2+5uMcWVxztGXuvxAwkZztu+lxw2mB9JLKd/2Yx/j95usyu5y
	 b1Cvi3naGfWiz3E8ULyVwIlCpOu+aVxt6dMqe26SSrR7XgFYcYUzAxE6FBQyPqm32fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
	b=d/QpAqzZIYg5k61vLwQ2TzWOgWLp7H2H2VxtT152HaW8uFh0ipz7ZJWPMunRq3PJv0mm
	 lfQd1NK+lIFzI+Op7l8DhA6K4yF3sOZWGGx17Eu7BiJG6LPNXSM3hAN48EsoGLZdHP7sv
	 i3sIBdrAb4W8zD7yghQTTLITQz1x9RE23Xgg2Xnu/Z1QLL28wcTXvEPHxBQmHNpHye+LL
	 tbpOGIg1du7TUckNbV27mFkfRSaBacn9MCSfK31VDti7EJDKXr8ICIwWIw/BCU1kAcj4a
	 0kvERpSL9+x2Wn8uECVtcDscfSvIhzKrGpsGUKBSoqXEQRDXXQa/HZZOar6shi+6lZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUqvqEhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqVbrQCS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3AA60A2636
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3AA60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUqvqEhC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqVbrQCS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNYa555516
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=; b=BUqvqEhCsOj4AdGB
	Dfktwk0NHcI+gwD/hO33KMhCdaTlGG13Cpb8+CArmd0+hHGBTh7RbmKIELgYsiDu
	eSCfuB3DiWDPOuh3tKu7NkJKZssBP77I1KMvoNRGN+sUkpTYcrxlk4lyjKJmKk5M
	FLbzp8jaLTI5K/PPqPp/5FQ9Z+9xuTEi/zr18deOygnyxXqYsmvjVGSwlIjrFNoh
	8JENEuH6u3Dtte1HURIn1CkvoVpURhonrNEXt2sDuMzyoa2Ynms42BFIN5g4WjFQ
	3o5IgUOEjNVoCex7eMmva6dujZrAPmzgjsgw76WtyVsBTn+4yqy51VBGM3RKgCqB
	hL77Og==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnra05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so154745185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601975; x=1796206775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=bqVbrQCSv84uqenS8LEaQJu5xs/wRXNyd+J8kzVmW1vIP6EKAVjB+Qye1AXaNZZzL+
         DMfTB3+pa5wTw1qEuNgDvmYmK8Je+Pz0M4OF7C7Xybknnsu42iW93nI2J1ygbPhYl2/X
         td88eqC7mg9fKIuojZZWoJFz7qwP5ePbCfPsbkB7h0xWG0lfumxKQjJIsrIv/nXtvdRr
         QwIkSNTshUMZVqj8SCMtAaBN3m2y5KEyi98I0OaNUI45GwLljH73wqsAQ24h5/jar2LS
         08jDTntLD2AMwnF4B7MpqF6Vsw24GoSdan3nwykf5j7sdfkmZHGtR5TPzVRLRyFBw13U
         m6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601975; x=1796206775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=mg9vgvXOGngKQEkfoWGwTGO3iOhqZsQ/2Ufvr6YmJVCxPIJo6ylnRYbvWOhXuoho59
         Ns9uqU+PJ83MyPNy+m9QAk1PPUaFDHv1aZt7bhZHqjdRuJu1wI2tbvASb2an9JzvY445
         5rcM7peW4wAZpgma3aclN4kw37vww4fxUa4CerKpJ1+djGxWVGALs8GX8mlKu0hIqQZJ
         hBHufhVbpwLAM7mDqNkskE80qqpfHFEhHy3X7x7XSt43C9wuxRJnn00nNzmemqdVuxsX
         i97/gMk83qFh7+sUP4s/2P2mD8SXRnsx7zJtIYppKm/QroCY12rfRwFcHoZz7tHhvdZQ
         stYg==
X-Forwarded-Encrypted: i=1; AL+hErGGwo41Kl8DG/CGAeMvHlsynyQAyeATqnj48tUln9V2PgG+o83zjicyMY12Rkh+d1cRL+gmT4n5TjEnNAsH@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qp+BUT+YcYiJjLOx2vpSCp91EuOEIeGbWSI4YtryYZG3KKW31
	CZfvbio3Iok0bJnk1Fc1qDOr5O47jStxdhkqOBaDrGfm1ARoxi4KhbWOnsZDGFky1FNpwr96GMY
	lU6ymxZvIvx2c1dNSDHiCcX9Zjsll90UsvATsh+fxio9IIxbXh2B2wPU3Zk8Tbt0kOIUP
X-Gm-Gg: AZFdTZf9N3H0ilALE9gszfv9Im0ZZXNU1Dzs5mp4zczwwxv1BjO9MY3xgA2b/Vf97WK
	aP6FTvJIsSJ4T15H123+WAA+KdpeUz6cXXTTvBcJyMNY0H9eaF27UTNM2MOmee7C6IfdXtQ+o+3
	ZztvkP8tpgQ9CBzTmFc5oRnHLSfp1Aa4/eU92ssVFL7WutWy3TsnvT5R9Eii3Xgu0zxLUwRvdH0
	D8ljAmGUaRQiJwguE5gL8eI6aYAwv+Vmyyp6jj/Hx/dREWqWamWrIbufuZPZqaotVtWr6iX6AQw
	aW/oEWrT2baza2cRfUcnRZ5T6ZjzvCMBs4R4hsaNICUm9+8i8rOj2tX+yqhjHzQ99lAVAhkWKQW
	Iy0g46ZH4eXJroFwzrS89m1xjXVxMGRbtkyccxz7F99DM2YltJW2ZHxPKIoSm00cekcw6/eqX4A
	jagfAuamu3vLK2eRU6H0d8zUbJpEnCtL3KRZS0xjDJlmhZHN7HbIhr+q2qAiJZiobVYBRJCoKdH
	vLPTldBUtiDACU38S/vnAtFs7d4
X-Received: by 2002:a05:620a:6496:b0:949:72c3:def2 with SMTP id af79cd13be357-949bab78ae9mr2742285185a.69.1795601974935;
        Wed, 25 Nov 2026 02:19:34 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:949:72c3:def2 with SMTP id af79cd13be357-949bab78ae9mr2742282985a.69.1795601974439;
        Wed, 25 Nov 2026 02:19:34 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:29 +0100
Subject: [PATCH v2 5/7] media: camss: csid-gen2: Report the hardware SOF
 timestamp
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
Message-Id: <20261125-camss-hw-ts-v2-5-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX6E6O1TVqLtuk
 kyHtVyonN3SWFP1EAv2ZuuVr3Vizyjm39F8dGiMxo6kuXwj38HlTRvQ4PEmNmhQ5KejQw1arQ00
 TabGE2xtsi3ddfJoOKnRKQbSBgtLthQ1SW3mnOk/R5TxpgmS5NbKFWXWNJ6tScPoqsgNKikPgYQ
 epnOL61JZx5uGiaFQpr/oadep0f8v/eKfejVl3xF/+dw7DUYdfD8yMjE+dFCegPM9BQgZhSaLD9
 vfGxb0zp0ZNOW91+Dau/tkrlI1tmW6wgET7n1wep8JCpwxLTcjFLkdoIICgC6xos/uA64QU4EOC
 oaKEKh2rjmcD5l5PpWZODNs97lSJfKq9G4e88OJU/8/QvtU+/RNw90nndFxJbH2UF52TfMO/S0F
 B51twrTE4lNbaXsgwj1MX/A9WUhzho7+5wh0IyV+UhdNPHKcL6X1xXRzI8au6HxAGoapvoZaQXR
 3UTHMxFXhdTTPWLR6lQ==
X-Proofpoint-ORIG-GUID: bEOlqfs6zgbn4j75c4OkYiDkmpZWv_I6
X-Proofpoint-GUID: bEOlqfs6zgbn4j75c4OkYiDkmpZWv_I6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX1QTJZOcg5iZq
 /81t+dW6w3i5mF/nQRaFOBbjisEp54lJdCib22pzPLGYraZyRMvWXhAUlrGJcY4EkdnN1in8paT
 +wJvW6zteXRe6BMzQSJcBDPsfVgzbQM=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b637 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Implement the sof_ts operation to read the CURRENT_SOF pair
instead, and let the CSID core put it on the CLOCK_MONOTONIC timebase
the event carries. CURRENT_EOF and the PREVIOUS_* pairs are left alone,
following the reference Qualcomm Camx code which only interacts with
CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 85e9eaf78df75f95d5f44f83b45dc7a3633401d0..47b0881e9c9942eeeaef53d8aa6b466ca21a366a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return ((u64)hi << 32) | lo;
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -459,6 +473,7 @@ const struct csid_hw_ops csid_ops_gen2 = {
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 };

-- 
2.34.1

