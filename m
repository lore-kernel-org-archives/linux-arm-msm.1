Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC5485926
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964559; cv=none; b=qBMwHkYS+0+1Lhcb8qo+r2s2uFRFMdQR/uQZvSDTdIKxK4ezaZOCSnD0med7razeYlH8o0cvFu63dzvNgVwH/3o074TMcZHe3obW8hV8JOVdt0FdVPkgcFmez5xlFWododa7BpFYu07rSwZFInjICBxRhaKbnfizQ1xp1vqadv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964559; c=relaxed/simple;
	bh=zKPIcvOng6sOoWT5GIAeoysX7DOIQXuoTK9dJ/h0xXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOT0rOWmF3mO3YuCid+ocT6yLnVB2Vz+oPKOK+f7Fu+ahwU2f76G1Yfcbfngipzs3N0VeYQ7kFuYUX50WoERHMnt/ibW2iDQNIsmtxpkO3DNTnvedXeNe38tBsrachLDzLHmO7qb7Hvx5EjSABeXh8iHv3i4yEMEQYiKO1DeP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHs4u3Ep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UIBRQqfv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHs4u3Ep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UIBRQqfv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E684WM2515922
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bwcuSGY118ee4NtPshCbzgah
	LOs36WmQjPRzBW+ykeg=; b=PHs4u3EpwD2o5FmrXfWp9HYocPJHSZz0vyHlZESP
	Ktse98DmzNlcGuoCykVY4H5PAQQqYJ2mk0DNEzoxeWk2qSB0YZuj5zxVTmXkfjfr
	iCdKk1ZZmsNeSq0XfHgJ5Qq1Yb8YRmN7BNo0yBmrO1x/o5i2gnX8/3pc5cfdURRP
	B2Vj5uSs+5bMBw7eag/+lFS+wkBShxgOXUVrzkCYZugDNA4ZiQkipS/6NT7CZlnd
	0eTt4hyVhXBhiWWEm7uJ4zAkL8FXWWVqh2WyHnwifPrn0xzh8eNsPEgHfTUvcnhp
	XRpf8LXXMHNzUvKagydjtfwWYA7/LcUm4vSPgUrWW51k1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4708dn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:55:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso149095a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791964556; x=1792569356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwcuSGY118ee4NtPshCbzgahLOs36WmQjPRzBW+ykeg=;
        b=UIBRQqfvnuMMVDVBPjtzFwSEWPPEiQ0Mgi9Uc0lu7eUhJ2nplt1UttpqFmxeBXPEuo
         CRCk+4lGhicUwmRvPUyX2RwpuhAh/oHQIi7KQTFyCxVHQ0pN2sFKCshO3A88g5baqxy7
         pI8LQe6A8+w3Sk172Xx4aDZZjN3MG3aIDlgprxTAX0UcZJK+tpEIl2EdeiC5DTd2EcBv
         TpvGhiMrbn4VC5MtUKJwjkFsMhySMsO94KEcEi464IOmQH62zlRdQfeNVA6I60OsvMTY
         1X+FuJRs7QAQMLdrE55VYWZI2Uuug5Xj/XXdNCk1CFTA+LwSJhXiuvoJ8yO++2fX2uqJ
         dOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964556; x=1792569356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwcuSGY118ee4NtPshCbzgahLOs36WmQjPRzBW+ykeg=;
        b=s7fznQqI+6u/189+kjtmG5J1pko87FHDPomELpEPooqPi6SI9Lwjm9kpG8YGn2DvwC
         pJqA+ZnwXbc/u1SvveIXg5EoN8BDsDNg3zO+f9faNibUb3BhxXQWT9LxDr1ebQXmoz69
         P9QMPrhmdZ+CchwG/yyVODxYFPq/FHWSee58EEpM77B31o3Ukm2oUn2/zdB0rvQ3m8Nw
         kZdFGaJOpObaauYxCte3nXiF4lTHBtuP6yf5+LFpUXLW2GJLAi/wZRXlNVuFcimDjx60
         1osN72SIxSDTpXw8OM2EPBBnyd5DVHaqbsL2odFAQhY56DPWNGUBha2OxhdlBRiipNOT
         WcAw==
X-Forwarded-Encrypted: i=1; AKwUvByfBprRIFb+La2euarVCqm9fYV7UOg1NQ4l7O9YoGE7KeJtGFOXkPit1sitmkNtmSTeOFNeKMjWNDWPfowI@vger.kernel.org
X-Gm-Message-State: AFq9FYLL8WH8JBBJ5AghwKHm/zfFyoKnTY2oQLIc768QpdKft1fexfo0
	jwF/SwPoAyQlGv2rgiR4hy1mPB9/sdlWAZo83zpLPfg0aHZ1h+QBqiQq0Y2/JGDPhiOg7hoZsnj
	bQla84BygnspBdsQ2qsDuUpTZrKOxuEwHkYqGJID1Ul+LYdC5bwU/EGHZHiEymzuG0HjQ
X-Gm-Gg: AYBFou0/EsKHceMyX/J6lNQdZqa9HzraIKMTgCWWYTSoIPouYYsANa0Qs1wVstI7mSF
	nynYYu9RCAOWsfjN4uHhigPsD7nbiiUTIz5357plXtMzz4tFjKC2ZOq2JWlGWqKogPqTOMtDQFo
	I0ehgauDtePtyjfJjxg4KVJ/riGWWt/hCdy1V+zIT/yIxNW8BI48CmK32kL74o0UrC7dpOeB2yL
	RMYojeLWk7yowc+rWZztFtmHs7ajSSwWg80tZZhy/ALd2+m93eRDWtBUa/XBNN/ptd4Wv7PI+jH
	TOXg2SSduqudprDa5WZCEMqOc6EkXTWPlV9PkmneVBaf2k9JEx4z46W0jTTgJbPt0TzYDmFgY2y
	78OKIzy4JFd80EKCU0NYQNR1O0MPhHUlY/iW3W/NYkw==
X-Received: by 2002:a17:90a:c2cc:b0:3aa:ee83:6f2b with SMTP id 98e67ed59e1d1-3ab3a955970mr13203637a91.13.1791964555240;
        Wed, 14 Oct 2026 00:55:55 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cc:b0:3aa:ee83:6f2b with SMTP id 98e67ed59e1d1-3ab3a955970mr13203609a91.13.1791964554428;
        Wed, 14 Oct 2026 00:55:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f2ba9efsm3255828a91.16.2026.10.14.00.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:55:54 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:55:48 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach
 at probe time
Message-ID: <as81hN8Af7CKCYtl@QCOM-aGQu4IUr3Y>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
 <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
 <as8zq_GMu1pkoMYA@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as8zq_GMu1pkoMYA@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfXxWeovbbeAOKu
 w4DYIyLsA7plhMiX0W0mjhUBj8u+05jnPqMouR4LzGkBHpERagn2Kj3bNG5L+WdD4VFKLqUpBrR
 nM26scwKd9COOs0hNpu87kZqCXB+JVTgtumPiH6tmHSsCJWXqibaxOe68y3+H+0KzSW6YsDF4d9
 JgJS9GG2YStmAeR/lC1K0R/2MOv/zZynyEY0/Y2hz2zQ7mqq4Wdt7fZkteau7vAuTvhgh6bVStX
 ALqbrptNkcu0jNuVLjKBf2qBFaeZhJ59yqz/BMJ7V9caG6Ea/CpQGW63znbMzNv8tf7tmghfCum
 Rl2i1V+0pFm2S7An05PlORrDWCRal6+x1emEV3ciqtqh+ENjQIimbsIAW79dSfrdEHgHG9QcvyI
 9w7OA+Rjo1iGVhM/C6Ejo7APqJdaMSIGU8czjdFkwGuJ8REtlpWYOkYQ2JRFV9T3JkNQWdNnrq4
 0S2yxYJL6p2xSsPUpRA==
X-Proofpoint-GUID: 6Gztzv-e60JxNaWEa7eEdlZLkUy5foBy
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf358c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-9aZd_Kv_hcnAOLhCNgA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6Gztzv-e60JxNaWEa7eEdlZLkUy5foBy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfX0wCrq5KGd+Ad
 8q3qNowHbO7KqBKKHA/TSu4sZf0GXj1eATJIwb7hZP212+5muZ3y6VaKF1Xfna6T0rkL6VYwcyo
 C1NfHndxhPSNvBtzOMMqSg/pbssI+rI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140031

On Wed, Oct 14, 2026 at 09:47:55AM +0200, Stephan Gerhold wrote:
> On Wed, Oct 14, 2026 at 03:00:37PM +0800, Shawn Guo wrote:
> > For early_boot subsystems, probe unconditionally marks the rproc
> > RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> > bootloader actually started the remote. If it did not, attach sets the
> > state back to RPROC_OFFLINE and fails, expecting the core to boot the
> > firmware instead. The core does not do that: rproc_boot() treats the
> > attach failure as fatal and the remote is never started.
> > 
> > This is hit on Nord with firmware where XBL no longer brings ADSP out
> > of reset. The remote never publishes its inbound SMP2P entries, so the
> > very first state read fails (debug print below) and the ADSP stays down:
> > 
> >   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
> >   remoteproc remoteproc0: can't attach to rproc adsp: -19
> > 
> > The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> > Linux has not yet interacted with the remote, so there is no reason to
> > defer the decision to attach time. Check them in probe and only mark
> > the rproc RPROC_DETACHED when the remote is up and has not been asked
> > to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> > path is taken. The ready state is read first so that a missing SMP2P
> > entry -ENODEV is treated as "not running" before sysmon is queried.
> > 
> > qcom_pas_attach() keeps only the fatal check, since that is the one
> > signal that has to be acted upon once the rproc is attached.
> > 
> > Assisted-by: LLM
> > Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Cc: stable@vger.kernel.org
> 
> is still missing. Would be good to have these fixes backported, since
> the original change landed in 7.3. If you used b4 trailers -u and it
> didn't add the Cc tag after my message that would confirm my suspicion
> that b4 won't pick up that tag. :/

Oops! I should have added the tag myself.

> Bjorn might forget to add these, so it's likely easiest and most
> reliable if you resend again with the tag added in both patches.

Yes, will do.

Shawn
