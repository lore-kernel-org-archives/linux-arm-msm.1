Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841382;
	b=IVz4Sxg1biwpFWajoyCTv4T1gZjm9cH9UjzPem4SM2l8JXu6dgXo9saQoMPLXo5k21kO
	 6Lg5Zk//GM9+lrfEvaRi/2zPYcRZpA37UtUUnykqEUf6M8EpUienSc4HaIEGRX0nc6nsA
	 YA9mhbOZrV89BGqjlKtJWiHnm8U9/U54J8JDBG6ffswlE0j/aU4IarIQ3dh0LEyvrzKHT
	 e6W6aelX+ZrOOEDidnoiU8itGYsZ+pBF3+/viBm2KdpissDvioIdjyB8vsbkVyljkEwD7
	 HsEtoID+v7Gu3vufJc3sEFFLe7waKBTMmou+pbX9tsYrlByUN+TjU4ClNeLZik9sDuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JY05mpA78Ns4BposrXRbEOK84uZR3De7JAwwkAwDybY=;
	b=D+ayOIpghrROcF80Rl4bXhco2Zqm+9c1rXRdgt7RFD2mxL9l4HF1kxkJpfnjaWp8zuf7
	 IkuI9YCP7dN3QyqP73qcfT2jpVODEFcREvdu4n4IVccxF1D8DPRaj0druzjlxBFWI9DHg
	 928zhcSB8Pvvsh/3Oo6nzA9609u/6LL94hAj078yXFuqSzbE36LJ/9D5r96khezZklbcZ
	 c1qPJeK2lavGgNFcI6tpEG5dRycfEskczFULUJiUhAn3aJ8wFMQsf83jPVP3WDyq8OyDI
	 Yd/4NkstR2HI4wfFzrEsGEnyKyU+PrQIq5sdT+VbLkUL6Lm3oy/taUh2j8UP/6Na0DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OVnm77cq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z1Xv/A6m";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D54606A33F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D54606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OVnm77cq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z1Xv/A6m
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrQ1Q1934757
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 15:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JY05mpA78Ns4BposrXRbEOK84uZR3De7JAwwkAwDybY=; b=OVnm77cqlCpQa4To
	Czg3abajcfeq1gCQUWHDADFjfqqzUn014DUNaUOwZF1/HdRU4pu6aO+nxCZemKxT
	u7a5Gp60nHPbqrk1IDcFSCAwD+AFMt+d2eSZTtfsfl8/qsuyxsVyAiEOSMBiTJLO
	QxMwairgeEcbitLDyeOvUMD66+2O4na+M93uqQxsY6OA/h8rgy3wb7rdzf9rzsVv
	EuVFJQscoZQbGsdahYorEq320cKe4a2VTEDqHeAWQe3DEnVsN7fh0hl9AXYlU793
	xxy/4DiLVY2U7UZNk+K16QKxIVbiUY9lQQEBQm3QZeZj3RcQfi78fbwWHV/Kuiax
	LqihJw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc2p5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 15:03:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecc172164aso3353980e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841380; x=1795446180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JY05mpA78Ns4BposrXRbEOK84uZR3De7JAwwkAwDybY=;
        b=Z1Xv/A6mmrVWCDP9QG38fM8IfsbGeUyK0qLIKf/5EpLGm6xQ/15NXecCfYBpq1h952
         fEHoOJLQUMyGrj/f3gcccIQZ07uEdK0WhGdPsppAGjT8G5MzQrN750y8qSDH2dHrSPQ/
         GkaE0SWfIwheS2eQuspw10R8CTUGELeZcV3BoQGm6sF/EHb68Qqnmh7U6kFl6IDHDFik
         W7E7e8baPK2hQ4RdcpyAadGH9IwVcn0dFLN13AgGROzcbRKhxD5HaFcVp83AX3hSz4L2
         ha72v1RsVmVw5o16Y2Ll29hqsvC1bqD6mrB15aRw6QAsPTKVemmRZwCTvYFyXM7+G6Se
         3e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841380; x=1795446180;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JY05mpA78Ns4BposrXRbEOK84uZR3De7JAwwkAwDybY=;
        b=HGMouIfPXQpcAOdVrHIEcKD0WjQMsPEG5NYMg5wcu98YKQ/zuBfuL0mmVhlTzn5f8+
         7dbYQpSrK0rI3nMtWAhHBdTOvuMIImd6ZJ8RGz5Z9VCZ4zW6wF+n/xgUtZYkie51dGQM
         Gw8IpWRZuEjG7MWVBl0w0v/a3O7aXpTKh0VVuoKn+88MDXI1E0jhVhWmJB+wzSEqorGe
         E1Lwo8GRzpWNauDuMcu5LCs9qTh0GnJA15h29VUb1UCQ+o2e/9dZVPcwupwNsu3dt3xd
         TPWISXJg7+WMQ0lwa3rqCBbbrt8M1HMb/QSZ2nTxxa0OofdQn+d/rLO4vJ/CL1OGBxxA
         p/cg==
X-Forwarded-Encrypted: i=1; AL+hErHc8xww+VIZBUhSO5DFmfLpiBqukpfTiX78cwlum+hMpvWKLSeeXYR6DD5RTeIQ1s3O8WszvoZLlQyaxmNO@vger.kernel.org
X-Gm-Message-State: APuU4Z+CvjQj+pOQToCbiODy87MLUDxlgWpMS8PCv1vLPKUGKQEsh0xP
	tEjMHvps1o3VTTvcWIr+1pCCFn2igbPBJnFI7/wS6297s7PVyFu7ZNDVxJWIv2LB66yAP/6L87Y
	wTYVujQfBGNxsz/4QGNXYG7JupbCurcQAmw8+ehIKw4aLmN57TLq8TSuiShfTBS2+w93Q
X-Gm-Gg: AYBFou3Jr/MmuiBYWI2dIx+cLT4nkBO9xQPl4Vqx0RECGxcGTmrH5jBpkLTXUfW4kQz
	QbSLqPN8r6dSXbPHecZh1C+w+GQK36m3k6Q8werpF6Ajb5YUCa87nQdEE6k89WuJPPo07RvN17L
	6M0ojIPqE2IMt8YPoHpIrM7dSHAwWkYYTdZFp+M34BCg2joO/MZVVTpfiDOoGiaqD0k0B8y/mQm
	gthv4g/tutA0RtlZQ5XxYP2n2NqMhjgm5UimR+mrnYV6fbf4j0He9H8kVMQJVOXAmkNVnC7PrVY
	4akKEm7VYcsrh24kxSHPGiYHuCoAFPhU8DsmL25SjNa9N1kOSiH5jEFhVApZvb2lJg/X0H2QPGA
	YGOVLEuXm4ykDVPi2ZxIGLwWYpKvQyV4b3rNvwTHCF4q4jZF6+/R/Ihvf9JBvctjNXSkPpGINo6
	GA
X-Received: by 2002:a05:6122:8b10:b0:5d1:dd67:3a02 with SMTP id 71dfb90a1353d-5ee34a9887fmr4067831e0c.10.1794841380410;
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
X-Received: by 2002:a05:6122:8b10:b0:5d1:dd67:3a02 with SMTP id 71dfb90a1353d-5ee34a9887fmr4067806e0c.10.1794841379860;
        Mon, 16 Nov 2026 07:02:59 -0800 (PST)
Received: from [172.20.97.26] ([195.50.164.66])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm23067266f8f.49.2026.11.16.07.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:02:58 -0800 (PST)
Message-ID: <b9143689-e390-463d-b486-ffd468be0805@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:02:56 +0000
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
Subject: Re: [PATCH v2] ASoC: qcom: q6asm: Correct the 24-bit PCM format
To: Demeter Barna <me@fromdisposition.org>
Cc: Michael McAllister <me@michaelmcallister.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
 <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
 <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
 <16b8f649-f464-43a3-b372-868351df9117@oss.qualcomm.com>
 <8832ef4d735b3fcdf48a2bf2a9997975@fromdisposition.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8832ef4d735b3fcdf48a2bf2a9997975@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX6AAkSIzOhrKQ
 xm7RzWICk1CSekNKYdgeLF+tmmVoug/mvF2bgKmVDL+En5zCZWhN5neJgjxJirijD7itF15Hxa1
 csMk7q4r7G0kVhumxK0G4qs3SiGrIQU=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb1b25 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=2tCa4HL4c9j_gEVsqMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: XhBuqtAfbxbvoqQfYNHXeZlo6W_79Cdg
X-Proofpoint-GUID: XhBuqtAfbxbvoqQfYNHXeZlo6W_79Cdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXzHgVsJkzC1IZ
 gZJHICNsBHsSDFSqEh2eyZpuPtF+tt7KP2vmlWhnvIpqnTIlPzZkQJL/YFosaJa5QKHCT0Ms4JN
 663fvtWZ5kJqT6853OsvyK2bqJ7K9uVGRD4p2cTFjnc1BDpbjVBemMX+ZDskTSBn+cAZjxuy8nU
 BHn14Mhlw2/xSUU/uvuQl6ztX7ukE2KPqfxruF7NtEF5xIY6uenO44PTjMSTY3OdlBywGpnFK2x
 tot4p6G+CQxQvFvPft3dA22Mr2vnonYH46scOtBamDeT2ckublSoWBL/TDNnfGV+lEkIjA/2OxI
 l/fQIu+/+uubfWjXSZRhvrw9fQeCfhwLtph86VAWWJyMxx+wRvl5DmBRVNvUjpw+NFOTIxFam7Z
 oLZBogdKbrFlkjjDeW0MpDIx/+LW7bw8TaVPigmbMs0/0cm4gCZGLAJAlvfkXHMk965MLaaC1MT
 SLCo8ZBcCtabHiiDfUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160059

On 11/16/26 9:20 AM, Demeter Barna wrote:
> On 2026-11-15 13:12, Srinivas Kandagatla wrote:
>> Can you please try this change and see if it helps. I have not tested
>> this myself as am travelling atm.
> 
> Hi Srinivas,
> 
> Thanks, I gave it a go on SM8350.
> 
> The DSP takes the V4 blocks without complaining, but nothing changes for
> me: S24_LE playback is still 48 dB down, same as without the patch. I
> played a 440 Hz tone and recorded it with the DMICs:
> 
>                                     without    with
>   S16_LE                            -25 dBFS   -25 dBFS
>   S24_LE (bits 23:0)                -73 dBFS   -73 dBFS
>   S24_LE, shifted into bits 31:8    -25 dBFS   -25 dBFS
> 
> Capture is the same story, the samples still come back in bits 31:8.
> 
> Michael's v2 does work here, for what it's worth: S32_LE playback comes
> out at -25 dBFS like S16_LE, and S32_LE capture records the tone at the
> same level as S16_LE.
> 
> So it looks like this DSP just ignores mode 23. Maybe that depends on
> the firmware version, but with the firmware this device ships it doesn't
> work. If you have another way to fix this in mind, I'm happy to test it.
Thanks Demeter,

If its easy, Could you try:

---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c
b/sound/soc/qcom/qdsp6/q6asm-dai.c
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -286,7 +286,7 @@ static int q6asm_dai_prepare(struct
snd_soc_component *component,
 	 */
 	if (prtd->bits_per_sample == 24) {
 		word_size = 32;
-		mode = 23;
+		mode = 0;	/* DEFAULT_QF: Q31 / MSB-aligned (bits 31:8) */
 	} else {
 		word_size = prtd->bits_per_sample;
 		mode = 0;
--
2.45.0


