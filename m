Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793601810;
	b=bUGkmWhVZUPMCAF5ok3DfZ5RsRwgjntCP8X3J2FGcrlQVXVTwwBaxnl9kcMJiFUs082y
	 2eKwomB1X0kCetmp/ctialphEh6WqgIvZRCFQQK2/g6ASIx3YHradxS8E9tFbnVp/v8BL
	 u0+cQHAMjNiIFmnPhLZDWDrwWRe5u+uWJvCSpm/WiscVtDXJgNv2hSHnWjUyfJ1M3hMQb
	 dZxnD/yvJVqCHpgY+r2F2fQs65mMiWtTNSkMI6T6IIG27PpLEkWqZ0JtRlPP6Gi5OLWfq
	 Yiocs1iVkZ5fGxbFBU+QtSRY1FqLAAPlgdliDq4aC9GsXzQsNFD835ZfJw8s9CPcnmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
	b=YEh+j019tC4CJnlGQwlZlufMDhL1EvcLJMaa3spdi9brDSMkzYJzLBleLfoyyHDvVLrY
	 ONrBuXG2RDaitlrM42kmp/aDlfRkjhALaq1ykFNm8iMPfSrpj1OjYERmkS3YH2tnR3n47
	 Y14h8JuJP6rE1IFviecSuiRHmvlrMOKRi7DvwdOChj7SHW4URFODNvhtYbTDJpB03xFmH
	 I501LYWX1WyfHBSE2l4ZB3KFT//3Gn9elpahnG6CmBe9nUq9kH8+o8J66KRazgvbvbfpA
	 HQinivghX6xNxUDKhpX8QR2YTPPScjB4p8Fsyw26QqYR3xq8i/ChzK6MJdqsf0pN0FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ea355nfN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBylMGuC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5260A2607
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 06:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF5260A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ea355nfN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBylMGuC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vLmL1676235
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 06:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=; b=Ea355nfNDVTQvAl2
	xBG2AMba+bhyh8m8w+ple6BS+BpH1fD4Uc7p/HU8qj0QTOWfTBFTZnh91OzIEn5w
	4JiFIr/axfiMk03rPPGBMKGApqWMWNY5J2ruCk+8/4RYb6edJ1EheDzoqA+s/UKJ
	SXNk+9n1dO9uG+jAgXc/B6ctrx8DaurPYyGbFmh+v7wTdNdif9Bw8nrwGysIjvXP
	eih/xJQ78Ec7Y9zeRkvhXivOYmYhs+0zxc/GzPi8cngBaPVWHkZ0MuMw4jB9ldNI
	K6VAKdaNRsclgQ0sBsNl6b9F3PWUUEb8yx8y4ohHGhzapcUp7KTWrVFX9FgKXvFE
	KeCCLQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7wgev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:43:28 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67682d4d684so4861833d50.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:43:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793601808; cv=none;
        d=google.com; s=arc-20260327;
        b=krQCNMuXVghEfAPqJXPsWFXtJCpdtfo0FnogG9P5oOdxvmI1nP+t1l2es7USihO8Jp
         DG841Ta5AGV1VYU1GJGcZ9Q8J4OaCOCeWlfjdmU08iKV3JJetDDhznHC9AZ5BrhLMBmO
         vp2s4dNzyog6N8AWOFQ++RXwYZ4Ugnglj/ezQklNPyktUVky6SdwIg7B4hV0LSkLbk5m
         evVbe5o+LdVr4E5X5QKtTUzPwB5B+lTf2kcNT0VTt9MRPrNFJWJQk0vnBjGJPEXUgxuY
         dgLXMb7jDeshARBak+34nYb551nq0YmlRxGk3r3G7FVVcTT/7/yNdTzFTYjEe0gwrfi/
         BDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        fh=3RrrBfKKVMwYvumuDhos5Pmd0sd8MGaBx+o9WMGWLQM=;
        b=T7ygocEhZymMrxP3bzz7X8PAYdzqsjWDHot63VHFyMPL9yjrwuTvIoYdFeqDDe3TF3
         Er/O833NUgr6/kh8nqjsrr2XH8ewf3aPZqv3H5Df0cPfONy4feG7T62eHWGywRIp0B3B
         hK9S77sG0qsB551asuSS6kTtl0+aIIUpV/YMgbRtUDrL+kEvPhKLtKMLWrefP3e7snZM
         cQUO5Wm1UaePp6qnOlUpM0US6dvPADqvaR8POPrhmogLx2oEWrvqKVcTbIlNsFfFJWjY
         PrYhpeJBul8zeOfrr3hfR2EAwMSLHbE1W1fMDR+gycKch+guAuuLJooQFH/3OW+UwPGV
         xrQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601808; x=1794206608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        b=GBylMGuCwlhDHRyPa+1VRl4QJx2sjK1Zrj5InNjFSP1rIGYvAew7f5G0RcPFZSA9ai
         MqrZVbtgH6tcjwJVe/KkMd4WaKuocKlSfUvShm+jELAhqrwzsMjiRqEwo1MYumXB5gQG
         1vxEU9Z5vc1NSDWrSsdcJZcUBuZLyaRC1befrqBAhmoSfLCND3XMv717513TIIC0MLyP
         Nf+DUgVwkWRJVZbEqaf04XP1k06lpawKfIJ2b5RouBWZdRa9d5C5fL3LPBxuWxyWJ0zX
         EI9AjC/PhBKWH1noaxyuSd3RiY+8+kfikg+qCTKFaVFK0rtlxWr+Dgq+QdSQySaroxsj
         sBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601808; x=1794206608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        b=u4/IZT8vvdH4Lqwt9UucOo+ddHiIuw25NTwrLy9NHENq18PgEiGahIb9qQeh+X0p9T
         64UiaHLwzB/rRMXkSYoJ5Wf7rmi+hE57CK8Kx14UuFMN4HtI3yNV39FqN68yWPB7bIUm
         O9GF4+ITYvr0pRiu96m5PD4qSPH5sACyl5cjqe7QKCQA/67DdLnXxiqSaYjYxVg1E6KN
         jrVIPU4zXWAZvHy+dQsmSXJMf0nL/kBBUrRlrjXtSaDhDad34M06+JGpwMVgWPQv++Ld
         wQycil2oNqcGfs35xekQYUrgjLfZziujzs7Cf6vPufR1axYCbyOA+OmffU/AUz/9ZF8J
         ilgw==
X-Forwarded-Encrypted: i=1; AKwUvByIFUyZeocrNam4aVyet0KDm1DCX/fqN8EdeINZ+v6eAn366PMaZ3g0NhEskJGAdL4vafo599a91hsiUEIw@vger.kernel.org
X-Gm-Message-State: APuU4Z/EhIosFQNsKjOlb55fuJvqvDxsZxBb/I1xOh9aQbJNBa1Fe83e
	zMlEfKQQOg4Ymsfsl5GO8cGNddqutcJobOjW0ShqeIf3iRsaQzLkDiS+B4XZQ2ExYo7WC4bGEt/
	AoV5izYN5oWPGK1MBv9e21fgR4VzGYnJopkTs40XVObpMxHWcQ3BNxhvq1z/AQWRR81JiXUzGFf
	BFg9n+BGj/LijWfAhpBLOc9iYBU2AeeSZ/Z118wtZilVVMxnFOe68=
X-Gm-Gg: AYBFou0N49z2xfenExXLc2fQedmGQlGnozmkv9c36m/mo9HJ5/XrIQsMKFfwgSYJmMe
	yeGECRCmMM62wgP5W2BZXMn6Kafc6HjqLCk3HSR8IxYad397w59Scqacbno5ln+fWhkQ0aTjvc9
	Uzb+ErbxpaYBnj5e9TXUMuAVL6tI+MMC7oa9DM2S6e5qKspmQYXJY49g/sOA==
X-Received: by 2002:a05:690e:140e:b0:679:99ba:180d with SMTP id 956f58d0204a3-67ba4fd0dbamr5409938d50.61.1793601808172;
        Sun, 01 Nov 2026 22:43:28 -0800 (PST)
X-Received: by 2002:a05:690e:140e:b0:679:99ba:180d with SMTP id
 956f58d0204a3-67ba4fd0dbamr5409926d50.61.1793601807648; Sun, 01 Nov 2026
 22:43:27 -0800 (PST)
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
 <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com> <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
In-Reply-To: <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:13:16 +0530
X-Gm-Features: AclHuK_nviIyG8fb19_CXIlxqxPEMtYwAJZGKcLdxWVe1gcuMOlrBn_vK9GS17U
Message-ID: <CAGptzHOtC+D8uVcLph=k9ZkbJALmJS7SrBEUHK5mAT1Do6HsXQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: AmdmaZezFK5n0htaveQynYpSrsrBd9Qz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX2AGotx59Lvw5
 L7TO/AhsryH0HWrkJVWMAaz6dFlkNg9WjuHDYX3/qM3sEQqaUGhdMPT6L+BdinyEMQ8pKiaTRlD
 Vqi7Ded9FkSapBgtc6niTJ8mhCuPL80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX6nuaYZMYqN23
 PLj4bo6Yps4tjlB33pVhTLqqhqW6K4Q5610Bo2wYnckMVnWcO1HDH27rmSt6h+KTo+EXLpjKtra
 joie7dCiiGCgmINIos9fhzdF5Nmcnb03U5BOF/D+sEFqYyrlRDIMo3M0dYb3qxbmELG9bpYS7zd
 v40R+5h53/4dyI/zbFC5zgzkV9ChoHYXiMrzEEfqysAyNiMXeOKvvkUTckNpekf4C+8IMvQr5qn
 GQY8Cp8ElA1mLkUA+XUuhGpzvDh2tU3YxnExJGrxEPIhNOTIQtpnuCmzB2gGhm3/Hlptf0QJtWs
 TkYSne4qpNguea8tycVuLnHX8qG/QAeM/PlMZZ/bwS8hMv86JdsW3wZxlKWzc4ge7dV8pruVIY0
 +Dmowa1xyWFDIFn3cHNifK3aVW/pN/oGhJAaaOAG1/Co0sboMj18yeDqOH1qixy43jro+sN5pGH
 gFEfAztjhXpUcHfsOZw==
X-Proofpoint-GUID: AmdmaZezFK5n0htaveQynYpSrsrBd9Qz
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae83110 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ygn1YfmRgnNSw8eP3TAA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026

On Mon, Nov 2, 2026 at 11:39=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hey Bjorn,
>
> On Thu, Oct 8, 2026 at 10:35=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualco=
mm.com> wrote:
> >
> > Hi Arnd,
> >
> > Coming back to work today after vacation.
> >
> > On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> > >
> > > On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > > > The following changes since commit cee9395acd8043be0644b25c34bfa866=
23f2b935:
> > > > ----------------------------------------------------------------
> > > > Qualcomm driver fixes for v7.3
> > > >
> > > > All clients was migrated from the Qualcomm SCM PAS API to the Qualc=
omm
> > > > PAS API in v7.3, remove the now unused direct API.
> > > >
> > > > ----------------------------------------------------------------
> > > > Sumit Garg (1):
> > > >       firmware: qcom_scm: Remove SCM PAS wrappers
> > >
> > > Hi Bjorn and Sumit,
> > >
> > > I was running a little behind on the fixes merges, sorry about that.
> > >
> > > As it's getting a little late for 7.3, I would suggest skipping this
> > > one patch as it is a bit large and is a cleanup rather than a fix.
> > >
> > > I would instead merge this directly for 7.4 but still take the other
> > > ones for 7.3. Let me know if there is some reason I missed why this
> > > needs to be in 7.3 after all.
> >
> > I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
> > to keep the dependencies sorted.
>
> Looks like we were also not able to land this cleanup patch in v7.4-rc1:
>
> firmware: qcom_scm: Remove SCM PAS wrappers
>
> Would you be able to merge it for the v7.4-rc2 at-least? This is just
> causing issues with patches being developed on top.
>

Apologies for the noise here, I see it in v7.4-rc1, the tooling I have
confused me.

-Sumit
