Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58DA513550
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983961; cv=pass; b=sFXdfrA9WttIHK/OfqatmmdB0bAlxXEd3CpJvz4hoNzqdGYDnU7OLKw4fF18phVults4x67Xq/gsNcqNi0LuV9vqwkA/ChPGi9UWHCd/Oz7ivGj7jf0PZzVX7xKUDM4t7Oyxyo3t4Dv9QqcSrmHhPCNY/1QcqQfj2xeWUcct6xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983961; c=relaxed/simple;
	bh=YpT2Qe/T2mt0iT4P8ZgElxgZygQNwPCoUxNvE7UC/eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPGQXexJiLLzRz+x8HegH8pot/zO5hZzhfHEcokxVEYI4+dB/9/fHDEku0LebPKWM1008Ty+gbGCFleGYbB2KCq1jtJwO3AuvpzMkCjU5qJ5EKQdMibdDZsA8zyn0AIP1v0xHV5wZl6EDi35DaB8mfcpKZsDrII4ewOmvuX1hgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaokhI9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OoiN7LAn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaokhI9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OoiN7LAn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDI6R3329239
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbyY7L02Rxh26+8dxarTEhQrgLb4aPc0R4YmO2fQi8o=; b=RaokhI9lpwfZtctk
	tnFXGMM4pdXprSGnRtJD1ew/HugC+VIzM6H8hM0jzHZRwth5cykuIATE/54nIMdw
	hbzL5Aq0lg/zvV1UoDQWgzkWAu68bbdE/u88OfcGyQJlhaEM7YNDj2hxoUlRo5Jj
	C113myqrV2HSinCyZoOLTFmns3LIZCA3IjOpXKlzcBZfZ64/FaWUmDmONRDoyL5F
	QvgNyBNyrUtRmNQDApW/qZL5c/l78h/Iz0aeIQf/Q2eIYL7dgU/iqihNfjgFemkh
	hRN34Ef/+BbXlgyPaOlivZ7YxNqg3ASdYLPnwla5ottWMvBXETXyWR3G7gE6ADBV
	Unm2oQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf005h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:19:11 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b37620eb73so8503833b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791983951; cv=none;
        d=google.com; s=arc-20260327;
        b=YzTc1+z9nHWXZNyvr9D244vzoPTmGpMDjJ3j4mc9+7egp5WbdEYoLf0G6C36Aq6ZTa
         /8nvd1lMd8RRRJx7DN4VFPKL2WVHNEbWBBIEMQ6u7bZiWw6x1MfmPoHGZ6QeIGE0pc4/
         93TdXcPaHHkeGMjO9Swcj3ziG/h0MO3RAjl+dtqUSLjBMYeDSovbIlVwl61opKyO6mGG
         3+ltLJo8rhQBYGMRojKJhQ9qlkGCcEOwsxZPX4Ac//Woj/O1Q5nmRr82ubiHvFF0dRyB
         IZWMXSeFUH6U+8FZN5LRc/xSw0hIUGikUNM81Y/1i4OEvyD0gWb96i53VQ844thCUx46
         S0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AbyY7L02Rxh26+8dxarTEhQrgLb4aPc0R4YmO2fQi8o=;
        fh=yPCUNwzX/CpFvKeFZ1sVthUnOwc6d4XGx6leT5q6wWU=;
        b=lzleYeOd3dDbeE2X3rjFQacgCGYmnmxj9IczmDoJX4TJwr+kvwXBH5g8jwkzmMbm6D
         hpUtaHjJYelRynCAliaoGqB2TM/0TsMCcK2WYg9mjC1lZKAbgJcPcjMeAedrY5p/IY6m
         7D6ieQkdNL+3PgR2bI7XQZlQNh5Ewkv6lpRRVyLrwbALJr31unDDUYQ2EA3zcXzivlzd
         f8qzGkSg1z98ZFFTUnvD6q3fRq18Xt1O+l2SbmmCuSwdWxndZyHbbp7loRfJo2kJfNIE
         BLUs1053StSF/6trSjBq1JLg29f8r2K6u7WA1utZg7JTNHtz166toAYMhbRUbGTUwjdZ
         it9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983951; x=1792588751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AbyY7L02Rxh26+8dxarTEhQrgLb4aPc0R4YmO2fQi8o=;
        b=OoiN7LAnnjXiQdTqj+NsoDCFizO4djPAcbVdP7Nx28gM42XLXpve1MOPKK58kIYXQT
         pNbO2OyT3ImxuFhdY893dkQefTgFEoq6HecEte5AmDApDhvPcOP8bxXb6nwnXk7to2LH
         LNhw/pR8nCQ+c7rR0V0tqxcpSJmtoZ6VyeT+K2RWScCW7plq1VgzVMXI0qpCRS/GH0TQ
         sJSHMBDb/haKHchBS5ah+QBcW2bjxrdpInUsenTCmFEDICIH7Ot6DQBEbMcmivyvAU38
         xEY5+wgVFQLfM2e/c/Yq+5h+T0EJPu4IJWZqGuBB+k09M/6D4HTcCm921SJRCyMGEczt
         MLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983951; x=1792588751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbyY7L02Rxh26+8dxarTEhQrgLb4aPc0R4YmO2fQi8o=;
        b=qTHhPjmYCTP/kg9QLaMer5WwC/Z2/ucfZ7rcrXzLvhO4fwKnnamySURTmBCSfiGhiW
         bf9n1YduEkX0P47rwfcqzy/Zy3h823Qs+ONQl3XK2z1nZptTarG0dZB0AYxdmuOBAvcv
         I0ZGeRscuJ1TCeMUb3sFbGm2IEjgvAZ3/yQ9QPDrkITVzy9Ygl8wc1Yr375NOQaLuC/8
         JqsTylAKokhenpjadWek7gOoJas/I4wyOwS4mi1miPgapy2qwZRt5xTzZTSKe1wNfmoh
         PHS2p7hyH66GaYEjqpkLrT85+tZVCTJcuxs7Vns9zEVZmssEG2Db5Y4KF93/XJ8bVCsO
         mz8A==
X-Forwarded-Encrypted: i=1; AKwUvBwkkrSKM1zWtsv+GknIxnDKUasyvowkfIPsw+1bYGOvnTuXR/rYiu/tucMuqlc5c0727BRgyrAyfTaokz0H@vger.kernel.org
X-Gm-Message-State: AFq9FYJrMXZDslYPzonfe+IrgCNN6uyLAg0PuvarHXwLwvyVaKgMRYwz
	GSjrNT2WZ8XTR3VfyAvRZipKAH29uUQZvH3wSAQ9ZXAVPX59bDg5a2CMqN38IKNjGeC/k3GlQEZ
	jefzEvCBQwJ0ZG8CkHF+jAPlk2oadBIcyUpLO+LDRecjEaYRtSon+nrN1wp8kS5/UbV0h1oGZHt
	2ZaMfLPYRM4a60pEJpLaJjvqyxoY/gJH2EAY9vrKCL84g=
X-Gm-Gg: AYBFou2dHiUsSJWEZ3tmCxixNjokiK35UFegXCSfbtqzvoJA8lM9VXaBTsZiSzZjjKN
	0Eqty+D5xAePirybQvQ9cXB/ymeu77ZBgchT2ooGzdrDCFjrIuFL6CjT6ajV0JQeYNMA6trBcpH
	FLmCpem9I7iK7xrRhZJzgdaFD6jOY9gWKsP+VmMuFGHPdIqJjJiaMpzeZ7nfCg8sSMvtkjPmyIB
	N3jJ2EcIos2nA/toCRYNv8B47fUthTqOdn792JsZa6WiqysSQGAh76wApLlHDs5XlBQTvaJNq6Q
X-Received: by 2002:a05:6808:3203:b0:50a:6fcf:d287 with SMTP id 5614622812f47-50c5804970cmr14735551b6e.37.1791983950950;
        Wed, 14 Oct 2026 06:19:10 -0700 (PDT)
X-Received: by 2002:a05:6808:3203:b0:50a:6fcf:d287 with SMTP id
 5614622812f47-50c5804970cmr14735512b6e.37.1791983950378; Wed, 14 Oct 2026
 06:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
 <20261013-cci-imp-v2-1-6873326b44a3@oss.qualcomm.com> <d39189f9-e9fe-4019-9b64-c4d7c0694c4c@nxsw.ie>
In-Reply-To: <d39189f9-e9fe-4019-9b64-c4d7c0694c4c@nxsw.ie>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:18:58 +0200
X-Gm-Features: AclHuK_Mz1Imq5hkpEYTlM0BjO4RGLxYs653XPdMkpOfKA6siGSGzQJSVK3xg4Q
Message-ID: <CAFEp6-1pYGy-TdQCY0pK8Nir3fg1hun_0pfdmH+j45sHZd8vnA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] i2c: qcom-cci: Factor out write command queue programming
To: "Bryan O'Donoghue" <bod.linux@nxsw.ie>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfXxQL3DHV6p+AX
 WvF+TJf4VCf1AvJjvjaX/Giyt4afCjCuSGQpLwsCzhzX9QSIOMTqNUEPmdjHx7GldO5Jflb2j/r
 G/ycvI6iqb6wRDDnMrGjp59klusmT+dMIYShcGuprB2G0RSIacqo+UiZSgBj0NyN78NqzONPSSb
 LW71SuAD9/2jxgwXnkWy7N1ExZA69yIvztvghv2StdG0Xc0alOO75ACj3TaYutvmArJa/JX83Wz
 O9GSwoAM+c4YoWdVLGa8g9Gt0VClwNn+HrR6tZ6WFOSS2hgcZ+c6XnB/On78LgBBynor9syDD9d
 cFN282ifAUTCLQy8JAipfBdaX3IyZbckr3f3+ndiEcFNewRpgvpJnS5MSCIzW6PbyQMPqn/IVlS
 Lxp7CmurtdG6DAEFw7k7ZXURnlnsM8pAuuDIFGhR/gLM9FFbnerjFO0jgOg6igJNxD2EPKNFC89
 DjMBvmyy9XCSGSzaz9g==
X-Proofpoint-GUID: nZJi1iE_1YSUn9mk-aDOEXbk0zLU27Gi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX2y41nStc9R/U
 IeGqh1jd6cj5wIXbEHIo9i107M1wHyRuH08rliU2eVlQG8lmZTwl5wRLsWjtKh8G4eLXrEPIiye
 wa3DQNmvbeer+Ahxecf0NczYk+hEG5o=
X-Proofpoint-ORIG-GUID: nZJi1iE_1YSUn9mk-aDOEXbk0zLU27Gi
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf814f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=PJnx2EBGx5yzlk0kfSEA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140052

On Wed, Oct 14, 2026 at 2:53=E2=80=AFPM Bryan O'Donoghue <bod.linux@nxsw.ie=
> wrote:
>
> On 13/10/2026 11:30, Loic Poulain wrote:
> > Factor out write-command queueing into a dedicated helper and replace
> > the manual byte-to-word packing code with iowrite32_rep().
> >
> > The resulting code is easier to follow and will be reused by
> > upcoming burst-write support.
> >
> > Also add a sanity check on the write buffer length, which should
> > already be validated by the caller/I2C-core.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/i2c/busses/i2c-qcom-cci.c | 41 +++++++++++++++++++++---------=
---------
> >   1 file changed, 22 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c=
-qcom-cci.c
> > index d509dc1c14700d9c199d67df19082bae4f1ae470..3304760411082b72e10e529=
a2bd66361e100fa06 100644
> > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -77,6 +77,9 @@
> >   #define CCI_I2C_WRITE               9
> >   #define CCI_I2C_READ                10
> >
> > +#define CCI_I2C_WRITE_WC     3
> > +#define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
> > +
> >   #define CCI_I2C_REPORT_IRQ_EN       BIT(8)
> >
> >   enum {
> > @@ -485,42 +488,42 @@ static int cci_i2c_read(struct cci *cci, u16 mast=
er,
> >       return 0;
> >   }
> >
> > +static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
> > +{
> > +     u32 cmd[CCI_I2C_WRITE_WC] =3D { };
> > +
> > +     if (WARN_ON(len >=3D CCI_I2C_WRITE_WC * sizeof(u32)))
> > +             return;
>
> Why not trap this and return the error - cci_i2c_write() has a result cod=
e.

Because this condition should never occur, the I2C core is expected to
enforce the transfer length limit through our max_write_len quirk
before the request reaches the driver. This check is purely paranoid
and is not expected to trigger even in normal error-handling paths.
Not returning errors keeps the behavior aligned with the previous
version, though we could have catched this issue earlier in i2c_write
and return from there...

>
> > +
> > +     cmd[0] =3D CCI_I2C_WRITE | len << 4;
> > +     memcpy((u8 *)cmd + 1, buf, len);
> > +     iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
> > +}
> > +
> >   static int cci_i2c_write(struct cci *cci, u16 master,
> >                        u16 addr, u8 *buf, u16 len)
> >   {
> > -     u8 queue =3D QUEUE_0;
> > -     u8 load[12] =3D { 0 };
> > -     int i =3D 0, j, ret;
> > +     void __iomem *loadq =3D cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(maste=
r, QUEUE_0);
> > +     int ret;
> >       u32 val;
> >
> >       /*
> >        * Call validate queue to make sure queue is empty before startin=
g.
> >        * This is to avoid overflow / underflow of queue.
> >        */
> > -     ret =3D cci_validate_queue(cci, master, queue);
> > +     ret =3D cci_validate_queue(cci, master, QUEUE_0);
> >       if (ret < 0)
> >               return ret;
> >
> >       val =3D CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> > -     writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +     writel(val, loadq);
> >
> > -     load[i++] =3D CCI_I2C_WRITE | len << 4;
> > -
> > -     for (j =3D 0; j < len; j++)
> > -             load[i++] =3D buf[j];
> > -
> > -     for (j =3D 0; j < i; j +=3D 4) {
> > -             val =3D load[j];
> > -             val |=3D load[j + 1] << 8;
> > -             val |=3D load[j + 2] << 16;
> > -             val |=3D load[j + 3] << 24;
> > -             writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, q=
ueue));
> > -     }
> > +     cci_i2c_load_write(buf, len, loadq);
> >
> >       val =3D CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> > -     writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +     writel(val, loadq);
> >
> > -     return cci_run_queue(cci, master, queue);
> > +     return cci_run_queue(cci, master, QUEUE_0);
> >   }
> >
> >   static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], =
int num)
> >
> > --
> > 2.34.1
>
>
