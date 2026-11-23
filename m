Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466413;
	b=Kh8IHHdYEPTK9v8U3TF2K52eejPp8sl9CQJ67cwDid6VhXt40wG0T2/WSwiaCLrPX9Wz
	 m8wqOBpvAQ3Pd4zYBcv+6Ys6XwFtiqoxAW76DNAQmZGMcisoQB2FVqop7nX2KXgTiXlYk
	 4Bzu7zcOLVXKoRmiaGRsA9IarDVjYXKfVg8gZLM8mwUnyF6elE/pTntkeo0gqlAaYvVsS
	 Oad+he09a5B2zMNIfioqXk86LTLFbWs5+pswTlxOP5BrfBUajf6eLhfP2JyVaVbuhnMM8
	 BuHijMdoJxwNKGOS7qRdYrltiogClmxrFZHPpH/eZwXRriZlilieO0Ryyn2EkPsA9TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h7PuijnsQ8tBYoL70IAxVi7XWsD7KOhH4OGNYUBfaVU=;
	b=cdAKlCtHA7Ym/qwPAV78ooIt+j+CrDOFCb8FTqVepXLQlitL1aMWs0JRGlSfiXRlwNEq
	 6BgYzV1+adqMdzXhk3NrcRCiicXPzOkfQhk/R04GUlVAzbEFsCm9QB70a+OYclR8skNA+
	 J1oh59VQ+apywseRbXIUdbjR3SXUFdxFqWeh8j7IC+vp2H3BZ3wptQ4zYP/6DgyIMGk8T
	 LXQLQGUw+NwOmqb17QuuocXNb+ZIvrVZmQ96A3n3AGOV50JGGoDQmBcS5VyiWUPGO0ws6
	 c9PvsPa+PX/0hWpFjFpc9hdAgWdAf7b/290Knu1YmO9cakb1WrXdhCvMEdwJnEiYKmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnBgJwOg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xw3scgOn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0ED606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0ED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnBgJwOg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xw3scgOn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuUMe720774
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h7PuijnsQ8tBYoL70IAxVi7X
	WsD7KOhH4OGNYUBfaVU=; b=WnBgJwOg453GEJCWBKdoHeY/cF+Hj++nt8m85ZPK
	a9DPmCxom/SwOl5iZlfu4N4iQ8JcAmmQbrZj50iiGtqv3vAtbnpbd4JvqhJXdCeq
	k9yxSbNa5IQUw1L23wrgtVIdydR6WhFvRhUzePb4+MbiTZiT7eZysKIncseC1djV
	Ch0SqkDenUsZJFeFIFMBzoJH3F2j8cKoF17ITmCMtzT5wCyfCDqeEtEZH7jZhVaD
	LYe68wLptLJ0+xameSioi79K3WKWsjhDkoGN5IxVUY72ikDmMyJJlQ8ol0l4k4+J
	uPKq68Rh617/0MtAHEau+JuOdR70YS+Q8OvyTY8GOCAHIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg8yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:40:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so680748785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795466411; x=1796071211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7PuijnsQ8tBYoL70IAxVi7XWsD7KOhH4OGNYUBfaVU=;
        b=Xw3scgOnUzJdR/+OGgiguVjvKwtfvPz89tK/AtRGR/M7GYbDd2AqfNsgjGlpXrafTl
         FjvLGyKUjYHaWYLlnwL5cdH8Kgu7K1vs8Ymq/ck0odRTgR3b9byFmtZwIKwO+iZNJBug
         PgyiY4dFEUZHOaiBcBmZsMBAFrjctHqHl+D6RFml8JsOplcAg2LmZ0c1ChjXeJA9FXT+
         CAaWOGOlkbcA+1Up5BMwC4o5JyrY6fZOR5hfsOdv938tBlLd04+mfev31wMBwEjSqTM/
         TTngJsgvkdPV2SHUavVtyermhABPAegu/w5T89D39U2dIWv19k40TrOiQM3494GCcttv
         +/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466411; x=1796071211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7PuijnsQ8tBYoL70IAxVi7XWsD7KOhH4OGNYUBfaVU=;
        b=gvq4ENuNRMCPbrWs7PIexB9x9SiJNDCg0OqCLL9faMnjBAsqTF4OFIXx0D35lf5P4b
         L3OPl0qHLXfIPYEIBEfnlvtygeui9QqeBgqu5Ue+JyGvcXqWuZ0xWbItvu8ZccfaKyro
         yOsnqYgsBhkIKGC4mqJkk/LbSYSaD/59dUM6vUUzYhk3wF3puKI78CNLhqNEvbzifOtE
         hNEl62+DGf5wB8NQdkfABT9gW/wBTZN9dw7WJOfrZDLvjeo6lU0eKxPD57nnZqdOY0QJ
         y1PPqGkquC/KlA8BVgIcsuoUaLgDtr4lETKHPWwFj9fboto+2YDXs67abG6vpumpNgtE
         PkxA==
X-Forwarded-Encrypted: i=1; AL+hErG++idA7YINIKikNV6PIJ36sd+EY2btOTzXy9gn1LMT3E5pyM+ZdmTiNEEowguuvRKS2uTaxOSbJZFE0bjZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/n3zV9Z4/gV06RWHgxu/8mXnoxPu5hUJn8x6dIwGCYeymBLgji
	3faIFF1ZTTc5BiLAGkqR+gooG8hG8LExAf8AN2triF7UPc5UUiQHPCzAm3RvqRkThivNpKRtLVe
	UG7BIBWpJPQhEOtsDEv9CWnTFeBguJiEZ3I9YXfjaZhJzp1ok9l6TS0QqL7Rz9M/F7lYo
X-Gm-Gg: AZFdTZeYozAD8V5DTeXpG4DHJ3hNCWTWBL2pGAHtX0AYDRr03Slq7uR7tYFr4GqX+qI
	fMQ/NtwHNQVlGar7GKSq1kkVQ06x+9XnzYZaIZIbdjCv1/cA1uFkkQLV8+IwJlIVc4eTVME8Smt
	nUqhyaQPbZLQH7zGXRVugbzYlG36tRkVgLUZJWP390NmP72ePryM/D6eJYrpLuR9UWxOZZGA/YA
	UCG7rAnwDjvFhjM6HHvo98dev4one3AiXtaL/D+JFySJxqnqwUITshvX97n+MWJsNbTOTqbbtx3
	bbrd0uLbX08vhX2IwSRGXpvhfkzXqG8Pwsp1MRiDgUSy2iJShTwipFJaSSIcVW+3HW5eNyic7Im
	khfYkzmPOthgC+yaswaoVk2BLHM7bbyVVr2uxaQkVQIu64kf0IZJ70AR3EvkCSOi0
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr2288598685a.3.1795466411268;
        Mon, 23 Nov 2026 12:40:11 -0800 (PST)
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr2288593485a.3.1795466410642;
        Mon, 23 Nov 2026 12:40:10 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm22561824f8f.34.2026.11.23.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:40:09 -0800 (PST)
Date: Mon, 23 Nov 2026 22:40:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] soc: qcom: rpmh: Fix use-after-free on timed out
 blocking requests
Message-ID: <d4zzqrljfmzgyyahf6fkpxvh3zqx5whpvnz2q2456ym6o5mkxf@zsmyjt36brhj>
References: <20261102-rpmh-timeout-uaf-v1-1-f1fe9d38f1b8@oss.qualcomm.com>
 <50103867-1f03-4346-8174-b7301ba3ddf5@oss.qualcomm.com>
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
In-Reply-To: <50103867-1f03-4346-8174-b7301ba3ddf5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04a4ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Vw1ili4nxZjTFdjbWr0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX71wwu0VG20K4
 xqlntvzbUthAKi6Rxn8+Gq/h+yFrnTqxvj1MrmkAKwZLYsDbWn6ozQ72MJlffrMU3j31Yu+mHtp
 xU4aoh28HKQJ3+Wv5badfSY5k/lpOGSpRXyndmGpawYqflU6Zj02UTI95d4oYsX6/moDShO8/x/
 dXVVnj8WBq9v6rrPs+chPA+c46S0qm9izxwUAwH9AT9yVe48aT8Rbt5eTUU0x7l20WjjwMa5pe/
 2TiWYwpkSDu3kg21SHhUTXfW6R8JJsSYEu3yec6ciEwHVTUpD9JA51vMzJ6UHUJI5tHj3DHpVpP
 5Dm4Vlg5buNl4LYia4GEf33v2ITT4NTFJTwmbIJ8KhQh5hjEcQZpfPZJ3zOQMKC+cY/os9s/Z5C
 dGagNCvg5H5pVTJuH9FuJPL1SFz3F1Yj49I0i9Tq+csMAkS4Twy59YLJUfrMzaxt4QhZCyqPQuM
 E4YuwE48lAyAce+J0Yw==
X-Proofpoint-GUID: -fa7ff4tpreJaVe5IyG_6l4pKsiuHDzE
X-Proofpoint-ORIG-GUID: -fa7ff4tpreJaVe5IyG_6l4pKsiuHDzE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX9lxEvFi9guTX
 /UlOxFglWcFwq3cI3uoKHYpuyl4OJQa61dOB34PZXKTK1tQAmkCLJqyvJc7D/8/+QdGgbSDV1rn
 OtZRdJKZUCH0xHeeMa0j4zvv73HS7pU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230082

On 26-11-13 10:03:32, Maulik Shah wrote:
> 
> 
> On 02-11-2026 16:16, Abel Vesa wrote:
> > rpmh_write(), rpmh_read() and the ACTIVE_ONLY path of rpmh_write_batch()
> > hand a request to the RSC controller and wait for it to complete with
> > wait_for_completion_timeout(). If the wait times out, they return to the
> > caller, while the request is still owned by the TCS it was written to.
> > For rpmh_write() and rpmh_read(), both the request and the completion
> > live on the stack, while rpmh_write_batch() frees them on its way out.
> >
> > If the hardware completes the request after the timeout, tcs_tx_done()
> > fetches the stale request from the TCS, passes it to the tracepoint and
> > to rpmh_tx_done(), which then signals a completion that no longer
> > exists. For reads, the response data is also written into the stale
> > request first. This corrupts the stack of whatever the timed out caller
> > went on to do, or freed memory. rpmh_write_batch() even documents this
> > with a "Better hope they never finish" comment.
> > Fix this by giving every request handed to the controller a reference
> > count and by embedding the completion into the request. 
> 
> I would prefer to use BUG_ON() instead of WARN_ON() whenever timeout happens
> just like downstream does rather than to handle the timeout cases.

That isn't an option.

From Documentation/process/deprecated.rst:

    BUG() and BUG_ON()
    ------------------
    Use WARN() and WARN_ON() instead, and handle the "impossible"
    error condition as gracefully as possible.

> 
> In cases where interrupt never arrives, already HW is stuck with no way to recover,
> so current implementation of having a WARN_ON() and allowing to continue to run
> will eventually end up in BUG() or crash somewhere else.
> 

The two things are orthogonal: your series improves what
gets printed when the timeout fires, this one makes sure a late
completion can't corrupt memory. 

I can rebase on top of your debug series if that helps,
but I don't think either replaces the other.

Thanks,
Abel
