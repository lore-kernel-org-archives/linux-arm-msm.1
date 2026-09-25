Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17D49CF28
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340409; cv=pass; b=OMaiJ2bVKEBA0zET2pvfzByAX/xptSI//FyLwwYTfNoguYqhJ5YHbaDQ+f20kgIRgwZzXWsl/LeqC0XHTG0qS88+QgX55GSEHDTNY7K/uVRlD7NMh4KtoIf1WXbmPDA+1Q2PqI+w0HBxZHTIEuq527U+l5cLtmCITAaB3HZGTiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340409; c=relaxed/simple;
	bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMBqbEZZuFJ9PFSPR6ptFCOorklhj63VVMq/I1OfSVxe2KVMaVSf8SFISxvqvMa8E9qa1BlgR717bLOtoDrfU1ENgzbYEcFrSppElmBqdn3w4RVTVXrIBQ5+I2PBrOka3LDznkFebnWlrIafa2aUnkK+XYRssXabTpqsD/h/+e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYRND37l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IdAF6F8F; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYRND37l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IdAF6F8F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLwIa900726
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=; b=AYRND37lW8jWqGFV
	EMTeyG+FZKnEy5vL3U+fYits/0aiDIdPkPQkN9x0BSY8KieqAxlqH+FKJz/ovMl1
	pi+PW955ABRDkDegByWGk5OQwdAm7J0lyDupnHk8r2q6Q0wEuetM6EPfDud8Vtg+
	lnvBgp+TZAEux1kE5J6RJ4GYEhE1WxoVknRktqa87lERES3NKZD6FEymRfNyrxut
	jiw+M63dUTkdK4yjXpqbpbg4dQUpBIYjYUrKRKHKzh4LnutRe03FEDwTlzS0ndoL
	1oaAr5u1jyp3H20NIW452jfWhlhC6tML+hYaMhSg8EPIGEdrRxJVTetuiJfXsDWt
	JYPOhQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr1007cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:46:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91051512080so13434746d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340406; cv=none;
        d=google.com; s=arc-20260327;
        b=sDI42iLBKHbHVgtdFuqHbOIIiH1ibEXcKtuIDmtvgEREz1B0AAWuNxCcSVnPvXhmwl
         zuFCbn1ft2wQOcRkGJOe8fohG7MlaSf5V8I5FxoYz1TSmItYfsHskWgyRgxmO6NftJUj
         RGO1o08EnJDxdXgcxpRrtvjjpzAeRqnq6ozSkOEtPBY1SEXHWcEgNO7ER1UR4fKJBswv
         mgP986/mAeOtTgTQs5LDcCl0XRGLMpSKUPHBkod5Rp3z1yI8Oi7fGbN2h+ePrsZpDpZS
         oVlbJ0q0h3tiZdvOjNgw4PDqzhFWzzQkzChnl2FtW2GasQTURun/hSXB40Df6U5/DlVh
         MGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        fh=iaB7WsmDiVjybjfWkb3o41O3veC3rfg3f3g2BgXgvjs=;
        b=Pf8SdofkxnFCE395WKNLbJiIjo7IcQprAPOs9fnd5Jwr7pIQ7D+nfIbLutWb0dVwb4
         ooigZrIu4OfrAi9AO25nfMnzMeMLssPf0vsVMnINPzg7Sj8I2+QPgOaeKEGO8CYVAvq1
         gztE9mUoaSjeFRQNZ6oWNo9Lbi7V4dWFNRlCevobzrrCsLKteTF1HDWoqqswkkOI7eND
         HGwYIMwjWgtUVXVEa5fBgujLDjS5QsYZQ1W6yJy4qTcs+fYbHSizgdCjzDMbxHdc24M0
         z6kZonCeJg3qh51fNP9A50Qa5D2gUhlMN2NYo3zqB2LWcJ9gyE8MV7F0kGuuAu05G4D6
         71Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340406; x=1790945206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        b=IdAF6F8Fs86CVas5ZLLs8fXxrvk9axccj/nvQ2CeCHhgGi0P1PMg+NmFtLKpoayme1
         /8fzYOGqF4m8wVmwaeQegbAW4ffaxADss1/Mv8jbsY8l3Tt+CkxAY+vl/5+DZbOk3K3r
         rZabjgdO+xzQZcswOP4TY1Yr5u0gkwJZ2C11AM/TGXQkHuWmVKTcnFQB2ybR6xIy2uOR
         FdArF51qDV1y5kQGZPtmxmSExHeyLOWr9vuCmQwuI1gjYJdHWk3HKHnBQ0TO6jvffYYo
         3E35uMVRy15lwlyEPT+4zhmlLmF5ybqEbMmQtFQF+GFVGNTCQ/3GkwcEy1l4hiSjMtB+
         Ne2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340406; x=1790945206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        b=G8U5WV7jRO4KbbROHhK19va3WZgtEKGgr77bz6++P7BauaABleo0t+m0Ki9y6TXaRL
         9I/alIQ1p8jHC0n7eRb47hArxI5KojGZqI8Rf+pRILsrrAsbeUZ4dWNmwbK8R58gWcEL
         x8NDchXGQQC2OgxPP2702xKoKrSvD8E8MkcjcVHr4yjQMYtT6OEI1iFnIykcUTPRTYWU
         x46SyUh53H26yooGdRa66cNlwNwSz8duY0ji1qQPdms8HVCiLActBM0Lhr4e6qXyPFou
         ZhQp4QYkEvMRWNwww2K5h3H6wqr5ARNHMF16GUQqiMTlXJjQIENg0C+JTNVoAEp2uJGS
         prFw==
X-Forwarded-Encrypted: i=1; AKwUvBzJVdBIL8niUfAkmWJgLCkJFtgaONgs7UiVZDaDmam6vHabKyPlRh0Tag7jniruIhKji5R/a6dkoP8CWkki@vger.kernel.org
X-Gm-Message-State: AFuF++mn+VoBX8k++cQplsVeEsxPGea6R37J7Pvju7t36w90uIhRihfm
	OsR7gcUarXxXYU5qFAogMr7yVVHhpboTyx5kLwaE1C7+IcC9uGJKMPkdHdi2wXuHzGu1dRp9q4P
	POF3D0GbgV3eOewKAf9u8T3qV7usnxxEKyVs3JWnASPadlnw0Rm8ABvrb0YMdkP+t0L9KJd7D5t
	ywFOHDKeKosvtJ7hLJpY7cTtTscY6D2Wm92sRhepp3o2s=
X-Gm-Gg: AYBFou2nrM3cBBHFsWGjRFZ/j8M4OKE7BUDIqO9zYFmp1YrQguA9gJ3UfX2culZEeds
	luaOHY3bzoZ5eTOdBPJlpQm3AKKBO2F5SM97Dgq6bLjUWR709lCD6J14gdqtZHrURmVddJTA3uh
	aZNzKsaxSl9a4KZ1Ls7qgEgwpLzDATu5vNq4V1UmVfM8SmSzSGA4xRTgRl7A==
X-Received: by 2002:a05:6214:2462:b0:90e:9408:2fc5 with SMTP id 6a1803df08f44-9142f63ee23mr38807646d6.5.1790340405775;
        Fri, 25 Sep 2026 05:46:45 -0700 (PDT)
X-Received: by 2002:a05:6214:2462:b0:90e:9408:2fc5 with SMTP id
 6a1803df08f44-9142f63ee23mr38807116d6.5.1790340405276; Fri, 25 Sep 2026
 05:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com> <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
 <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com> <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
In-Reply-To: <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:46:34 +0100
X-Gm-Features: AclHuK9M9IbbCEpkXjmHN3eWA-5m3q_sE1ucHvnsGGxug-EHSGOK9v70zRPAC84
Message-ID: <CANyhwx1EG=2FyBm150wrKpj=kQ1066iwZWndx=ZL3BKNoZUhVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX40F403TvzQD7
 82EGRjokvfGso9zzDWg4lmVszh/A4Tbi70QwZdKo1LZy32lk9Xi+jlkYVyH61m+df6xWBpVFEqy
 em06n24zdMJl3C66wcJVUo/tyGIYf7zm3LWSxqPnpyVUKAo98chbDdzZQWDzJyMCUXOoxU0MRgi
 GYIac4w+Xa01MkGp3he2GHqXkRrDAKApKiiic6UgI5wlKyId+RFObWZP/Q8iSAL2r9BY6rvUlop
 d4UTJKdpt5fp69UEhJGkcHv6tQFFhhLoHrZywwBEK03qlYeZ5z/0nwblEJlbG8VqqiiFb3meJ0a
 8t7ngY5CJF7WV+7MqgjTr2baHrF2XIcx2nhPTWOHrhMYghjXAeJpnY8AtH4uJ8SfXYRqGTCawsj
 0FPWMgiJXzoJh5UFeHiP+AeVFKEbkAwXM0X/wpjrrUaAPpH4FktBXHB3bgYLOapkJRoU96CtuVG
 jvDxGpx7pQ108oILvGw==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab66d36 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=nOLRoRm-sisVCJmKiMYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: i--gbkz203en-JTOo9aJdwiparVa4FF-
X-Proofpoint-GUID: i--gbkz203en-JTOo9aJdwiparVa4FF-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX1MdUnOQrZb9P
 jK8kgQBxcrQqGv5w4WIub2700QGb5v+ZkmE26uqEg0otBS2cg3YCdQcFamI1HGNBzfdmvF7fLxI
 XVoaVPrS3EDAF7AoWF3Sd6wc0kVvAgQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250050

On Thu, Sep 24, 2026 at 4:58=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Sep 23, 2026 at 04:03:38PM +0100, Youssef Samir wrote:
> > On Tue, Sep 22, 2026 at 6:24=E2=80=AFPM Juha-Matti Tilli
> > <juha-matti.tilli@iki.fi> wrote:
> > >
> > > On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > > > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > > +
> > The chance of collision is slim, but still not impossible.
>
> When you mean collision, do you mean node id collision due to bridged nod=
es?
> Because, even if the directly connected QAIC devices use 32bit node ids, =
the
> collision won't affect the functionality.
As in ep_nid of one device matching the nid of another device. In MHI,
that shouldn't
really matter since this patch moves away from using QRTR_EP_NID_AUTO in no=
de
assignment, but as you mentioned below, it could clash with TUN and SMD EPs=
 that
are already registered with their ep_nid.
>
> Also, there is a collision with SMD and TUN endpoints, but that's out of =
scope
> for this series.
I have not worked on a system that simultaneously uses different types of E=
Ps;
only MHI EPs. But if there is a real case of that, we can move to
global ID assignment
that includes SMD and TUN.

Thanks,
Youssef
