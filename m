Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793599758;
	b=YPYi08zkTZOJjcL5v4PR0UgVAKLAP2BjGFthxyeEdNVt5Y6aOhgjKpO2fPNbKPkaC1ah
	 Yola/qSoClFIhxmXmlthWSgnWPunmASHznCU9D6DfxkDPVRSajtPCwwFFAG/5LZJz3S81
	 rXVX6BDTqTtXScq1uA5WJtp99ck23MG2/zTuiJxEmN7lsyHMR3lXUtBIPhYHQ746uL5tj
	 TPgYSCPK7hJIvFTbt0w42aVpQhPj03Yk99G8JXJux9ePBNTPtGmJ2fquCWszcqhKSOlFC
	 6QSQ5KXvNeZlTBySC4FBRukoj7l7fUJn9xCGBXITnlNxQewpDJheKvWJbQgaR9h/fPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
	b=GS6eOBpDWb4ZXbMlC7WOrBFFhzET/UWmyEuMoOk9jHQemWUTu7aQEZ4MfhXN5/WW3Hcc
	 lKRj15r/9/n28gqnvefvJ4d+tBcoBnqUvX8rnxoNeK7KAKz53j6yRGvwQPG14Z+8Mu6AI
	 TjEURg/x24MMV921YTyc5Dwa7tcr1tTxCXhtaXUk0Qv++mjQ35n0G7EfGCNuaGs4ogSNb
	 rkTSgD11f7i3zBr7wQJm+NXXBOrYJQIHg2nlxDZcwehIm5km6iDZHZDbJmlu63wDthv5+
	 WoSXE03MOr3gWjVGCWc8jSUhuvqzzFmkARfeEXSzMWYVIahWgdK8UEi1PyuCTa6oxYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF160nBl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bgrFa+pY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043C606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 06:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F043C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF160nBl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bgrFa+pY
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vEO83348756
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 06:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=; b=ZF160nBls992pB7m
	oVZcOD1SOxpQ4fAPh5X3Ns3oYFTa77lximGLGfvjk4rT/SCSPZ4EBKOH7E0V7Ixh
	mo+O/qdY61Vak3aFHJRg+rqqXnJaI9c0uaPp7wqKbd4Lwmekr0uTT3KMRgQfy3FY
	b2fkBZJ+E402ahWYQJzC9ERlJEps/o6GdPi7CbligQJjgLofmWGjzLSZMJOsZl1L
	7I0+mj9lUV7A8cHm5IpEp0cTgYokMaMx8hxSNjiFPlOrCqbgK57fuiqrCdClvHDH
	qhveVHJLEN8J7ks0gLe2rzaC7v4MqLahUQd83ZSbk/Bq8ZtQUNX+70e0bKpjBqdU
	n1qbJA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxneka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:09:16 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836c416b236so39570657b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793599756; cv=none;
        d=google.com; s=arc-20260327;
        b=pUn1OI3bj8VAFD9bhFydBM3jzpOli4ZhvEfclLDcdbMF5gY3+cYuMW0trCreB6YwH6
         MzWi+qkAa4pS/KeGkAx/uvnhgztkjGcGHMO4lqcQ7+YR7waaCMahhH6zdTPoSbjIHGQB
         YUqedZLt/trkDFdDaUSWRHVFnIB1JRj2mrpb5oSkw1enIGPhaIlJtewxr8e/vUFJo1Nr
         TCX1HIFHz2fw/hKScieJDe6+hM45Lph5BAM5HrIHlM+gk1dHYasFRtlKonmQqvWLQw6c
         s66xvsclO5zcZPxYnenUnmPxaz2+ExoAz9p8Zeb8eonGAQNdloxDGb2jROtirmUNxLjX
         1RHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        fh=wDNfqgVQsgal730jcfJR7s07XX67vqFgA54s0IpHuos=;
        b=NzzCrSeRHWtessCcAkjSd/RZAgS3mOKRIelL8El8kOIiD2Hpv4nmLiMjqclhsmCTjC
         JY4xS5+cOf2OQDgP5EXdqGCaMwhgpifmM9e1smcx7DnIq47CKLqmR/3ETT9TzvYIWpov
         klA2NwR6L12df27ijOXVmtdWel3W2EaDY2cfCXdwGL0J2JfrnakzCadjAyKQjS654EMN
         yieswJcldJNGPLGCGJ3YUwh93o5D38cs7sHBSUMEbExX0FWkYHhtfVwbdGQrP0hKf7hb
         ByuJFaSvdetxpXvdzPi8Xnsq17W4pmE25RghDb+6czqRWSmir9zcfZpGCtUnVYUZUCzl
         s+Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793599756; x=1794204556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        b=bgrFa+pYsVJSs3sb+9DpfiMtaXxVx/uoIkMStkIuYk5HYOPEhmcFiG+n5Cvo5wxQyL
         N+Kq2wX8Q5CCSpvdyLcNPgx7mg4ambxWp2w7WMhBaOzjONRsuY8AeUcCYx37Q94fyCfi
         SfezfKgmPIyiNJFIIS0Kjwfmm8CFHTVa83xO/Hy7zixEXdL326iliuLUGDZsSHzOanU4
         jzZWzD7VumlzxDAPL5Z3xMuTroMjU2rN5CTH2U+RqW9QkwGqZlm2+xZYdgfpqF/+V+xg
         XElj1enAB2jjRGuuoKs7286OCfroSk+JVke5OgLz2sVWCBWMScrv0/T4+YyzsLHUP8FG
         SzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599756; x=1794204556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        b=m3MTwIRhWxST2vDe8Fwnv3zJuto+kUysl6FGVsyVtANR0Z/iDllsq0qywd7pmhp/uY
         dJTB5mmgCgq03bkSTcNi5kzIP6eI6eAMan7Hhtq+FVdSyjdAiPe/yQ2KC+Q4X9hK7lqi
         9XjAeSb46WnfeIOnlytyqPkPFOXBJh+OGGMFuxNlHitaAJodgMKL50FLD6A6u2CLY3iA
         v1cPImmbw6EguTwrifyim8dPky2p/+FmcAHB5EAxRrVbptDjQktwAhpO3zKqwMGcGd2B
         PPLern/Y6IpRlMLnl4pe2X5Dgwswq6FzqkPGgfoG39mcUXfaE3+gAxkWi13lH5xij/PG
         PFww==
X-Forwarded-Encrypted: i=1; AKwUvBwJGLvbiusrvrVqUPTYA86o1UooDUyCEniE8WNVvpdprzjYqIkPZz2cK71iMrwf9XwCCmFaSWC5q4jwuw7W@vger.kernel.org
X-Gm-Message-State: APuU4Z9MsNnrgIxUPyV3KROcs8+3PVWfZ3aGSiCEskf4r97F7caFOFvL
	0kkZK/YwIgzZmciVoYDaVO9UDq7ZdySrAiYFqEA0v03DcnCYvEYCwkPjK1PuLqFi4qEvwIXbZDV
	4EVXEXfWw+4sJv9oJx6LgSnnDjQdeSAbgn/rRuGwjTECd6Xsz7GbcYZcuTUbFtvhJWRqF+NYULQ
	lN5GsJddrTOLUqUISQs6AJA/EiwicOGlos+bi1M8IXDR4=
X-Gm-Gg: AYBFou08hcSJWX8U0LjLLUDcahpf/XfJiqjLvqQJFYWcs/oqQBsh6rFTr0QURms0PZz
	6xTduZXwiZOneaxHd0JktD7aGICI9qr9tI5wIFXeONHY97FgY0sMj5/cClShLeyaQf1NOtYhxsx
	icwysWRAPNb3S1Ov2t2ql2um0EpanfzDxeYthXanlkcWNaUPqmKEyPw7hGag==
X-Received: by 2002:a05:690e:4594:10b0:673:e272:f3f8 with SMTP id 956f58d0204a3-67ba4c89334mr3369648d50.20.1793599756047;
        Sun, 01 Nov 2026 22:09:16 -0800 (PST)
X-Received: by 2002:a05:690e:4594:10b0:673:e272:f3f8 with SMTP id
 956f58d0204a3-67ba4c89334mr3369635d50.20.1793599755206; Sun, 01 Nov 2026
 22:09:15 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922130653.357615-1-andersson@kernel.org> <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
 <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
In-Reply-To: <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:39:04 +0530
X-Gm-Features: AclHuK_ZGfEtpfZA1498jVLU3PJS-3rP5e-VPIRkigYGxV0PkiHkLUhpOvX20yI
Message-ID: <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: khx1u0bBFkbrbTUURp93afEaUS5d8FIF
X-Proofpoint-ORIG-GUID: khx1u0bBFkbrbTUURp93afEaUS5d8FIF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXy67DzffrBE9S
 fe6r23Fgg3/YES51tGMRQiA/cjmrlbj/XuGX81dOFeNbEruGQ6RjlvGNyghua72zdVZ6yecCAjc
 stH/y3G0ieZ6Hurbl7ZKK8C/9Akfndw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXxiL2TdbuNvNN
 4shfKrKsuojwjTxK4K36JE07tHsH4HdQscHlV1GkK8HpJbZ3o1ak6NO4xp05DLIoY2wVCzz170H
 HEkVCsT4LKWkZjVicZM99T8Pgmk+StOC4xpPFPBC45vSsee00GfBl3SK289LWej4LFefuZL3btz
 G2FnTJg+Mwst2EU6rBxiAYS+E1gosE7CerD2wrgaY9necU7lMPgBy9GCLbmUgtjKJ5zYTpZpjwJ
 DGmi/f1ekV8yb2pnkrjHZ5QfbZwK0LGL9Y4p4uvwucJRm/S6CgynnDW6O9kPHuy+JCaTWKPVeCA
 uWrL+rSMWU51SlWplHbyvVBqsTHDtmgs6dTlZIdxFLSqO1uQ6JoZFBLnlYnteD9bIinFC94DLqa
 gBaujBiW/WGxAnC/JiyWLqVkDGQf05ow4rkRIxTZBU3UhJKPDgZwIp8vFjaXMgyaUgpHS6fxVjs
 +U2tmpvJBClXcncjVxQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae8290c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=kdkvEyMxHJgC4A9uITsA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020024

Hey Bjorn,

On Thu, Oct 8, 2026 at 10:35=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hi Arnd,
>
> Coming back to work today after vacation.
>
> On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> >
> > On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > > The following changes since commit cee9395acd8043be0644b25c34bfa86623=
f2b935:
> > > ----------------------------------------------------------------
> > > Qualcomm driver fixes for v7.3
> > >
> > > All clients was migrated from the Qualcomm SCM PAS API to the Qualcom=
m
> > > PAS API in v7.3, remove the now unused direct API.
> > >
> > > ----------------------------------------------------------------
> > > Sumit Garg (1):
> > >       firmware: qcom_scm: Remove SCM PAS wrappers
> >
> > Hi Bjorn and Sumit,
> >
> > I was running a little behind on the fixes merges, sorry about that.
> >
> > As it's getting a little late for 7.3, I would suggest skipping this
> > one patch as it is a bit large and is a cleanup rather than a fix.
> >
> > I would instead merge this directly for 7.4 but still take the other
> > ones for 7.3. Let me know if there is some reason I missed why this
> > needs to be in 7.3 after all.
>
> I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
> to keep the dependencies sorted.

Looks like we were also not able to land this cleanup patch in v7.4-rc1:

firmware: qcom_scm: Remove SCM PAS wrappers

Would you be able to merge it for the v7.4-rc2 at-least? This is just
causing issues with patches being developed on top.

-Sumit
