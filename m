Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793239990;
	b=EoZ+M44hPSITd5ApOEmvTr7tgbs0wS1bdP7YMrK+ilAnHRcx7CwYmY/DbSgU6tKi3aM1
	 JaKTVXXU8IkiRlwVXinmSDtK0EZIEuNeMn0o099ZnNYjEARYpPuz6ONexLkaCiC+rs+KM
	 bZaYuK19HtIjJHutLP9ffxkoFVZycDpaWtJeaBsxYO8w+c25/q8O67DhTQSAhnqoSBFCi
	 0xEE+gpot0wp3IySc3Z7JLdPLlyHz9ahNtzNnw5TPBsCp2w7SDqpBSIn81rYFpSRImwwE
	 haYLlJ9IDQ/2R0DqVeFilSv3NGW8LmjTH9ZXATdRJnUaebictyqdLNYY5cLwb0TPToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793239990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
	b=r/trZohg0L0/uyxhlTyqTkgZd6O5Uu1gCRBPcNrTlzkPXq9Rux3xy2ZKFllHNaA2NFOD
	 leouQt97QEHrSZg/W6xwI3+GZF31wKDilYchv/S/AsGA7NI4nK3PTUz9qe8M7RPKL0pSP
	 Bxb24WeytkyqMITvv+Pwv/+jsWWMdZC6uSd/Z6U3BIlTx+Heb6+93wnCHrrv0hn6MlJhJ
	 9Nh8W1wHfTpxWfbUV7M9iCSdRFCC0N/fA2Um3joLfwD4+kso5DOUrlHuLDxZ7qBj29uk/
	 h7faggcLrKy0W1WG0tYVtclgZKaScaEi3S7FAOdrOdjjKDhy6IGrOCT4r0jmVsoqIWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cDXds+7i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCb9peTj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE961606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE961606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cDXds+7i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCb9peTj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jOO13374747
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1ZfFpRYMJHgMnVimUEMcJlJt
	QnxuiTy6BkExQhm9AuQ=; b=cDXds+7iozhUR4Ua0TOXiN3UTA8EK9QM+3Ae9/58
	ksCucRQHnTmxliv1ul+ha0ZiHzDv/dCcT8ljG8I9CFytsChebO2yUcs5k24YXr1D
	DlIpYezqnz9ePwvOLnZ41kqTEQkkPsdBuE1R3qfgZjIeMtx1DF/9F2e57wtJf+W0
	F6xKne7+L8UGIKZZypSryhGztJtKrkMXORZXpoZyCz+GGW4Uw+5pEsFpj1avu4Mn
	af3fLEaXVw3Y04G6zroVLszc3u+BCzgsAGL2s8LUgomP/7owVmI8zaFqvD7aRgXD
	AGEIngRTQe/ppdAW4B3bbnO3PNgMuVyKi+AJSOus2mX1Sg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp8ft4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:13:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so5303548eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 19:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793239988; x=1793844788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
        b=QCb9peTjW1gpq0gYsn7nxNQI7VSomjBCQ9ImnnflYYuvAB56H81SnzRBkHQSAkwehe
         m1oW1zQxyB1UdW3p4R6KfcfI/l1WF9ME5JG9O5o4lVMKABRTZ6cGnRyXf1JmZu/8YQNi
         aY8l2HHuHLgoZ59BGK+toEPbkrYhEseHHA1Hw6dILTEzgBxivFsz+IoI29AsXg1mDm+1
         WwUa21cvYWFoP35pPFeiRy/kCW4Fa3eqdNNBwFMXqMv7LPWQi3B+WVgnWKvL42CctbKm
         Gap/+SgEULZ2OKaMyD94HQ9OFVTyTEfBmuJCGHEPiNAtewMaFc4rSnUvVIXeSoaeRLnR
         O6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793239988; x=1793844788;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
        b=JUdfww4NAA3VxtZo4MAr1vQQZM7DE1Q18lnYkqrbV2VdGSpaFJbZPmgBJHncYrDotm
         AKJtzgQ89eH7Y+XlkPoTEeT2UwAYJKTN5HlqbVX9w86K23cCo4w9YpfrNwPuMg2N5Du/
         rOu5qpjoQCvZBkEf04R/jL2VdbzdI5ciyhOzMmvr1AyobzxNiwe1byLewL+MJkP0TNrq
         jPA7DJtKb3ZypeKfkodKLPy/5n02oi/I27gh3dti+u6cYWgbIOVJy2r0ybqSXJhdgDhA
         IPu+58n3fcDj2EFrlvdAHSi5ZsdTXFLmgiigh78VsG6erRZUguKHRlFaphmQMeCZd/86
         5UYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMR5COkTAEwtTfIBNIDy4DGPZORsEPsJBhl3hmbaKqz7H/YQd423vHI6JIMcAD81veeB2DbL/4WH0YtL7e@vger.kernel.org
X-Gm-Message-State: AFq9FYKR/fw3tj/WX7YsFpjtSKILlOnBifZI9WgSYjxM3+VWxLHgloc0
	CQPYKwGxUUrmqqj2ufBMeZnFvmtoUIixv9wbAOJMMhHW1dReNiWRNpQ3PKobVN6eJWMuUISQsXB
	X/8cDAksrDa6EMxcOTBVfn0NnCekMRU6csWZ2PXKL6qHmEhQtcZfQHTdYLiBKezaSrH+d
X-Gm-Gg: AYBFou2IJj2vb0T6919p4oGcq4TBQsF4yM557dxJmqa03hodzWjpehy7MNra4/G2bEg
	wcT6xkZas/hvyTD7ow5NoED+dKTK/zswHWo8ZMlsj8mycK5z+6IdQtTN1Ob2z/RjjgX5Hd2sqGE
	vD24XvN2O3KoNTjQh1DlmgqjeLjyVs6m6U6cAzIbTAsVfhaAIH54ayUJHi5Up6FMurS+UYGrBqr
	nGMzDM2NazudQgsgUOSGpZLmoxZsSdtFNFRocpNzQtE43tQXmgOyL/6rGYoSTJhqF5EncIF7azH
	vuApcUKGhkCnCiOjx99pHLS30YeWNKJxJKW2FfXnNHqvS3UkVOp+0p7/2iJON3TzbS5zhJAboSh
	LA7HNDhNMJIwSmcT18STSMm0lGcW7o6C437LyocaxYT4jWyDjlMw3PfzEjPhTtTmvxjRpklas3X
	c0DOasEkL5nWtK9k4=
X-Received: by 2002:a05:7300:8801:b0:36a:3005:aa65 with SMTP id 5a478bee46e88-36a3005b037mr1710972eec.15.1793239987364;
        Wed, 28 Oct 2026 19:13:07 -0700 (PDT)
X-Received: by 2002:a05:7300:8801:b0:36a:3005:aa65 with SMTP id 5a478bee46e88-36a3005b037mr1710930eec.15.1793239986781;
        Wed, 28 Oct 2026 19:13:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm12163260eec.11.2026.10.28.19.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:13:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:13:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Message-ID: <auKrrKu5O7T9fXIv@QCOM-aGQu4IUr3Y>
References: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
 <679f383a-97a1-4505-8bd9-73ef76bc0d87@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <679f383a-97a1-4505-8bd9-73ef76bc0d87@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX0iHwzuhJSdpW
 2k+EQaZYAfP30tHtzfRp5WB1Z2OoYG6wtPi30mT1U2Q5HsT1qRqE6nFKWgLjW+5zWHEBAQFeda1
 MKSkPO6p5zKTE5dojR4eJK12S9HDCZUHY7yqlLbhra2mvDot8UUs/2kMSdGEFG5tAxfwmBfERg8
 LeOrO7gn5TAdXEYv0wkTIsFHGXmMBPrG+Fs6i5l2n3x1hPHNrbVD4Rz+dF8rKEsPuj36wXaJIZv
 SR41kmALmqZRRciQGSCiwyzOQA5VIqy7jKa1zzkx1BTOTKDJWqEd5odR7GcoZEYVYcNt9UnNJme
 TCrl+cTXOewGtKolWzAe2PcyhEQQWjW/Dibm9VAByn78cOMEbbOLeXG6ei/+esb8eQolZY1m/em
 FKNUf6GmcTfmQEmCL1+HwLNpLfdFaVrmCW+nHzFsh2aWz9EfVEbFL7uPIUTqhe1+6Vx3goa5zrj
 OEB4BUPt4YVMyYwghtQ==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2abb4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VBx6HuuRU8mu7iSl-QoA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX2Ee4rKI7s0+H
 GoYb6w1guqN3ra+VtH28mxCr/0DZY+DQt7zRO+8Zj2NvtiWalhwTpDHksrTe5bLJ9X0/x8Xa/2O
 wWKiP3nHHW1Ym3nU8VHi3H+sfkbs9a0=
X-Proofpoint-GUID: MT_N1kE5td5fD-v6pw1YST2hP91DaSn_
X-Proofpoint-ORIG-GUID: MT_N1kE5td5fD-v6pw1YST2hP91DaSn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290008

On Wed, Oct 21, 2026 at 10:55:42AM +0530, Mohammad Rafi Shaik wrote:
> 
> 
> On 10/21/2026 8:23 AM, Shawn Guo wrote:
> > Derive the AIF_TDM_RX_8 and AIF_TDM_TX_8 backend channel count from
> > the cpu DAI TDM slot mask in the DT, using the same tx/rx mask
> > selection as q6tdm_set_tdm_slot(). Each board then gets the channel
> > count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on RIDE.
> > Keep the default of two when the link has no TDM slot description.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >   sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> > index 9aae6aadd43d..f3fb13145b3b 100644
> > --- a/sound/soc/qcom/sc8280xp.c
> > +++ b/sound/soc/qcom/sc8280xp.c
> > @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> >   	channels->min = 2;
> >   	channels->max = 2;
> >   	switch (cpu_dai->id) {
> > +	case AIF_TDM_RX_8:
> > +	case AIF_TDM_TX_8: {
> 
> This should not be limited to AIF_TDM_RX_8/AIF_TDM_TX_8.
> 
> Enable it for all TDM DAI IDs.
> 
> case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> case AIF_TDM_RX_0 ... AIF_TDM_TX_12:

Ack, will cover both PRIMARY..QUINARY and AIF_TDM ranges in v2,
matching q6tdm_set_tdm_slot().

Shawn
