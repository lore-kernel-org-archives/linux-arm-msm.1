Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768155;
	b=usFCeGfm3HNh+rS5TUef5bHg6Thybe856B8WWBM5sxIh3dVJ4231rLtctKrpVf1ECAbJ
	 el6PGvOG5QDlqzSRcBod9KeIHM17yUd56rIlK48+nVaXXkehnzwD7fzdyokTiHtSlhB2x
	 yK5QJmWBE7ekSs1neRqdH+jRdBZ9iFTT2ggBH+Qca0yiTCubqZHESohm2HMNypsF/rkw1
	 dUOr5PAqfUjfTME9cY3c3IcswmDmEhPFoCV2gv3fmbTSaalxuifh1yydPgPYSCWM2gNG0
	 fBZP9EBJQ743BdyZXP2vBuy9cp31X1hV9S+/2DfIZTs5mOUN2+f8JcOUkEaYiZu0ntA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kfo/uUXo4SYUGV47gqbTnTk6IQOHSsVCeoliGtXTC7U=;
	b=TgaKwg1CwaFcMeQXYt2LOCrEGS1FHS3SNQLAXipTmRtVfSHgrYGDXcnV99gyvqPxgNh+
	 3YZ2h8XHJsuTcidl2ZTHDTOS8+Qe+yNL9A1u8xdAoZv4p/yaYQzD7n0SW/TfwRNJkwJoF
	 X2izogbhdHrDYNlye8XDJmQaeVOgBru52BKv2cG1NsTQMVyDWA/J6/pXq4q310pGj6Ebi
	 lr4yyUW7e9dc4ltkOsvmz52kTPIZobdRM5l7oHYcjaOV8ylrzy4xn2E0GyZbtC/q0irxJ
	 Wq/kbN4hKlSyyaiQnubDFk09l6D1/4hcEGlsaIcC8Ht3OUFd8eImKT21BOCfrG4FqOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzCqiUJY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksMfgpAW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A8606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10A8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzCqiUJY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksMfgpAW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7I1M23118313
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfo/uUXo4SYUGV47gqbTnTk6IQOHSsVCeoliGtXTC7U=; b=nzCqiUJYjFON2rh5
	iqFHUCasnBlJRSKmwiX/1eiLmAeuOli/h0IZVK9p1SyYCo0ea/88SyAkMH/X+Vrl
	+3M6CJMHpFj2+VZk1DTdDHmH06cpoFSZhPoB9GhcJscbvhv+c7m5+hrOauEKy2T+
	j6F6CwsMUoXh8WdIcZFtfZpdJgfirhVXylsAD0Pv2Scgy54j0BCiQKQvfpIV52NQ
	D9FoFFv7zknbkIRDB24K9O8d416lggs6lX54D3V33kpePSYo7tiOfhGxvmQskxYK
	g4Qj9e48lJKydAQQaiYBB96wo/jG4/nFKYUo9FkSSRWqJkWg8QgdPJaPWzUN6CYN
	pWxlyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh8pbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:29:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so23792481cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768152; x=1796372952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfo/uUXo4SYUGV47gqbTnTk6IQOHSsVCeoliGtXTC7U=;
        b=ksMfgpAWeII5qIVeO1J/MAtEHm0w7kQD+QWbSubZOiGI5GheuzPuU6bGvGYR2RJVqO
         0+ZbKF33nSAXWsSywLbsGasdNJIgJQ3r4kOBhsp9g95VYzTzgK13pOBWzPMJ4BdSat2U
         oIRp9XOcW7BnwbaRe7dxxA7Rz6XRth/yEaS8zSy5/L9gfrSeyhi10AB2Nl1xeeUsTXjO
         4sOGO5FuI2ecnNycnliVTRTJPeZFMnRQxJVvE0pl25pzoFIp/Wg/jKw+2Xx9Wy7A8I6k
         dJUciWo8i64vMq8WtnxUPN1lGdAZsjChsJdQLeKM/U0rOXqhj+Tv1o/j2VgUpXkNqFTE
         MHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768152; x=1796372952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfo/uUXo4SYUGV47gqbTnTk6IQOHSsVCeoliGtXTC7U=;
        b=XLJEC7InL4ACe7GQEGeZ4iGga7PUmtwTN48+nkYM69eW/+VyRPNWZcTWxYQLCnSU8z
         GHcib1KtOJ1xzNxnhX0Jgpt+TRQL42PlQaVF5W/nuDxBn184sZpIn8sS+4AA3UnjN7nZ
         6Nfk6VnRYiqBU6aM4T9iwE4YalQWbUm+Hm71Kmlba87O05BGc3ot2Dbi/I0hZZ4NpFLC
         XLADVTtYwv6nZyftKCTh5+WAzI7H1sIzutYLOaAeE0fIto/h6ttw/VOkSscrB7+WuCJv
         WVanJ5K/M2FYsWJJgvV1eGKTxYTcixHjdybGAHAgCLQO9Zp10W0+o0xW+aLTQy3h8X+X
         e4sw==
X-Forwarded-Encrypted: i=1; AL+hErHm8/5EDBvdPTNwItqrA0b47m0Mjrcq7NflSY2LX5kQjuZI0UFx0WJX6qEUXgo1Mvhk/W8ZCobpMXPI59sh@vger.kernel.org
X-Gm-Message-State: APuU4Z+IhoVfUB45lklNx7k39lNoYfR5GAaocIgEsoxcDPMV3IbZI/l1
	+rKHSeX5IR52brp9fhj5xIhn7B0XPiAnUz5jl+UKwb0eFpS3Ijs5gp2Z1CaVOmExE/ctBPzzPzJ
	SOO+EkfRK2Qf2DJ+snPXoAud2pRj9L8n3WVLFKLxtqHpg9U+Tqa6qYbUVBYeT+/qXYrOAe3DLbY
	0Q
X-Gm-Gg: AZFdTZfZFbIjEHcxG0/MErwBDE/mSubdueF1cOUQQjX1xMGBuTzjhEzEuEtyIgjyEcA
	mQ9BYaZQT3nM5dFN4+PGOHwKx5a3mPEBHLshVoKFan9l9sYBfEFjKoU3INkVN82fMyymHz84tlV
	9nrd2mEOW6gq1jSo+UkpPEdr5Duc1FBjs4zJJ+bjK897L3Zstg38k3uA072TVUoI7ZmnC+j2SVb
	1t4Na9I3AGGbf6SlW2ibyyxDsPpCalkzw6VxmhFDODVM1B5YUsmwd0OI2wqruASe9hKY9ku7fhu
	c6TmBIlX8BqwbLC2Ur/Yn90McNVd8U93KpGLY0KZ4qVGRf0HToYHo+LPO6ruZyi1CEsrnIji0ME
	MbkA/BMqNdmLXci7e1nwopCQjOXs6zUczK/eXNxhd0iNmWImlRmGjZl37uO49wvj7hnxV1NM=
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr427147691cf.4.1795768152116;
        Fri, 27 Nov 2026 00:29:12 -0800 (PST)
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr427147471cf.4.1795768151700;
        Fri, 27 Nov 2026 00:29:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed51asm826246866b.76.2026.11.27.00.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:29:10 -0800 (PST)
Message-ID: <7d01d01c-ac17-4211-bd9c-7f8809512db9@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:29:08 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Put QMP handle on interconnect
 failure
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        konradybcio@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        djakov@kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20261127064956.1950950-1-gopikrishna.garmidi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127064956.1950950-1-gopikrishna.garmidi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX4oTv2if1e+b1
 7cWFKg5psFRZqXGuivNLEFg2Qb9pdq5FHIccHqWa4UMENJ443paw279lKLl9BWlfftCJjUZfNSY
 w9/K7KmMqsfVPpJWL0qBy9PMEOrA1t5/5qNP0hOrxRLZPRq9SEv0iLc+63+QGaLrVavaVvC1xvg
 mU+Ur1jYmrVuraAZ5dqdIEj4qS+hYWCERtajivmWdyWf7U81B4gcNq8WYELzAVsk71tpAmgsdof
 8T9basZMQkJJJ9fuqtOk2s54V5ZpRzELaESWVXcr3RxJkTaVQuDyGG2+8oNjWl+deO8mNVdtmXb
 jvjkRY/pKUjpzOKaZDvoMFGTJK321aIBX/+cbv1fWpOFymPBCTpDHlAA9w8kwhAOQ20dBfdERrd
 9AMNIIqOsIrufaCaVYQ6J3SsBqeQ7bYsFUTsOtJQ0c7WpCWhEIxldrtQxM01DQ+8lPSLgjk0Xws
 13BPNDzL6Lr0sY/cjFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX4NdIs6YnefJi
 agTeB+QqzIxnFVCYCsntomrx4l78gN1gJxbYtDjynW/h30r1qNYGqufQqavDkJ5bw7B6lMPibFb
 wNujiewkppl+5UB0rmnbOiUMaXq/NMU=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b093f58 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CS0JNJqnihLjlYYSz3IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6mByLYmuR9DfmcXaEU-N1RhD4r2rhrcB
X-Proofpoint-ORIG-GUID: 6mByLYmuR9DfmcXaEU-N1RhD4r2rhrcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270033

On 11/27/26 7:49 AM, Gopikrishna Garmidi wrote:
> qcom_q6v5_init() takes a reference on the AOSS QMP device with
> qmp_get() and drops it on the load state error path, but not when
> devm_of_icc_get() fails afterwards. The callers don't call
> qcom_q6v5_deinit() when init fails, so the reference is leaked.
> 
> Since the interconnect provider may not be ready yet, -EPROBE_DEFER is a
> likely trigger and the reference is leaked on every deferred probe.
> 
> Drop the QMP reference before returning the error.
> 
> Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
