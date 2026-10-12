Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C854718D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807330; cv=pass; b=DBdWR37BT1xtWTmA3X4AXQ9LrPf2aK7UmWSedG7jieYFlH8CvQXY/j0EuwGlk5iSasbwv/57OSrqFwg3YK7X5PDrGLPaqOu1LfFoSW3XbPhMbp+I1m5/IllB/oPK+ilSBX2phssmBXrK7BubsZ6D0NDaFDhXp9DQtVAjE/adAlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807330; c=relaxed/simple;
	bh=XkD4CR8PxcyIMPcQRsfJGKsjJYowH3YGB0feBNav0jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpKksA8sLJF7ctTaSIMLH5cgExLnp/nxy4xSqzdgs88/rjLh3RE8MCJnrBtj7b5WNYQ6Zoi8jVu7wl48nzLscFL+CxHUigKOS+zauAIVEQQX0nniBvWCYkcSHrF5ze+XY3GTifUikKLcQIub2jhY6rMFHJsKmiNlff2snrrNPIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIgjJlun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vu9ljooc; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIgjJlun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vu9ljooc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08Vs3292287
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=; b=iIgjJlunebaL+dQl
	y7kyAnjPWPQyVlo/xPz7GIFkfZwEikr1zOuPIKSPYaLj2MtDHc1fdFB8f8op6wLW
	+XMplFk5+Z7AG/jH9ZuL2TiFzMPP32hMGXSdfS3lnuyq/QzPeecOx44JYznM0IQH
	Y05Esm7GtzezMV7x/ugGG37oRlDmgeWBqjUf9QJgdGl5QU+MQ0MJEShQEI3MpopY
	Kh22adoL4j3mzdXhgg2zOoQxIYBXT0260kg3Ri3iozM5FeIa8lQ39KhkRkJ8ufu4
	asQXAmQZl9IqLL1TX4ixiUNYH8p4PmLogxZ9ZQj/y0R2aEuC0LAieJO3S7XcdBo8
	pAxgzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3h85b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:15:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc0b31ecaso385960785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791807328; cv=none;
        d=google.com; s=arc-20260327;
        b=dC71Zi3BjX3KF1jMu1ThcdfJl33uy1odPpD13g44G4oRBeAPvuMYW7LsjMfRbjvXRf
         nFbDYE5K/Y03VD7GsCls4yhA3QRo8n+5yIdaPTfRAaa/E6DPVF4HitWvKG9bJs+262q8
         nnApmkDCf+0O90vHR2MAbtuzROGaiD1d6/PG7nwrVo+km7krSKMAgQ2xlTZHjd4Hxwzq
         p8iFjUK5kAgheWIYTxGn3+iMzFXQAS3CqodI4WlQcsJBG6TYBaKB6t+hxtRj3m8o27VC
         MNTo9xX55ZCDlHu3jCper5M0vtw0Tdpszvv03uALYNZEgqcVVeflWYwIvm69jlr3QnVo
         a91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        fh=v0YF+CruhoVOKFXLFuGzpnu+cj4G2as0Zux6/UXENIo=;
        b=XdGetZVfPb/5Mn4KLIYJTFN4cVW5iXKWivk01wk7co5mHzdpuUXc7yj2vv3XtSlvfV
         9bFmrl7V2eMqTA7wcn0YcjWb6F1uZJJzpzfxnIZ0T5mKRoVviGr8AaA9+A9R8hnZQg5y
         23sfTd+eFLPwUXXKCEazTdg61S5LVfTEbiWuphhRfhMCRjMRnhiLROfShs/pIWB1Vro+
         huBidOFyV4yiMTIoV4v5od3NNrSs/V7ZDUtKRvAPo0d2+44L2W4mmJO3nA4OqNo3KuMk
         dwOtyZh005VLsa+mrAYyezIqcNNjFTmIUxVCbud6T7Br8xIi2Of1xUnvNGzChVGfD5DH
         6Lmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807328; x=1792412128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        b=Vu9ljooc4h7irLf9A5f0CVe1PiCwC8cliBJzbgzpTyS9aWXjcGm8iP3LQSwKbrTrUC
         6Zvp0UPE/M0HtMR4uNUrrMJNZhgtSvb6u8q3rCEk72HEf8hU/ebYtrWSLqC9u7P9eJX+
         FS96jodkWiVJAgTKZoYZ/EZe84pfythcLAUcGuR/5tQrrVJxzQ5QHRRk3pRJLCuhBKLr
         wsqbKfKOkGB3TsNBhjo8NZLEJSm8S7cm94VhKH2Hfsa7BvwcrJljyyGFbt+Z4q50wmap
         3McbowlK2GNbetu+QTGaFCLw/To4gBhCnIhhg5xDutc/vfeiKb+PXEYPShr58jtSMDWZ
         6A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807328; x=1792412128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        b=zXD2aFZlXY5HbT3uql6+1xO4K+sssEqzaXcsfRpeu8BnsWpJiVWrhgVo4TTnDXKToa
         jDA6mfIKiRDW7fwIuIvrpuvpI/+OuLOhJzctqXmOhc4LxxTfAXyep1rc13R/oYzpKkRl
         ISVHgFUa8NcAPzAIlnzuRtCmdlAF9Gf0t6Ciu7Ejw/cmgvf9oyPAZIc4F9YRhY5QzKr3
         IQJMYmj/d+Cx2cmrUnNZ+tl+RyEN5Lc/QNk/RtbEdLLAKlWdix26UB2iufcfeJqSzyA/
         mOmrhfWtHhZMkV4tO2Gq5QKC9bBlZYsY3/u3fEkvSSgLXUCVWodQLdndPkiekZOHhJyC
         qgkA==
X-Forwarded-Encrypted: i=1; AKwUvByN881Y2lTOZYQ9avGRCPjtjgRbLH/9nA8XOS4jICE1HJY6w5RzEcNkT9LrzidRxNbg2uRoqGR81/W30HsS@vger.kernel.org
X-Gm-Message-State: AFq9FYIo9/0iyc+Fl6MyzFek28gXQ+Q1/sZL8DmymCDeRKigwRke0Vxo
	CnATRw3nv8pR9aRnAQYJw5a9eoFzyYEWV0ZRsrLOFeAD2Q8P1+ZuzdxeC5hnKmEK4LuEBTLsHG2
	GU/SMnL8Y5MTSVFFVXGOFEbd4ER3+vVXlgLfYpYwAuvEIu8AoFP6w/1NBKZbTi2dgx5XE4z0RCo
	FkFqpZ5CAQPbSGoDPSQGFjgl3VJ1w/MaxjnZeu1+/zYT8=
X-Gm-Gg: AYBFou2IuNqtcSW6RHlfgJx1Qv4aK7QeoEN/kUro5UQg+vUMoS4NOYGq196sEpdXLz8
	zYCddZbFaYpMKHv4iBUTcu7KSlEZSNu5BpecXyhzadT+uyoX6C9NYTSm8f6KhHt+7NUA8TLA5lw
	vZKKTxbQTja1hjBPJI7PPdJW+j+DKgX5TWHR6bOgJSd8bYDiQcrxvBmd0gTkKUIMvNd2oj0MN+q
	pLnO/awhEjNhWWtJGj/zHIRhuUn/MF5A8uhC28Yc3uR+hpKoV8yxAuopzvxxm5ZzNaCrcUF+YA1
X-Received: by 2002:a05:620a:224d:20b0:93e:c619:92ef with SMTP id af79cd13be357-93ec61994afmr1003165485a.42.1791807327953;
        Mon, 12 Oct 2026 05:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:224d:20b0:93e:c619:92ef with SMTP id
 af79cd13be357-93ec61994afmr1003152785a.42.1791807326529; Mon, 12 Oct 2026
 05:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007182238.1154851-2-peter.hunt@opengear.com>
 <CAFEp6-2QsKyZfEdSotVPhxVNOyRzncUphqLY5cRwHXGJiEbzuA@mail.gmail.com>
 <20261009001714.1078580-1-peter.hunt@opengear.com> <20261010171531.1659006-1-peter.hunt@opengear.com>
In-Reply-To: <20261010171531.1659006-1-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:15:14 +0200
X-Gm-Features: AclHuK86CgairrG5EnLwkN2ULrA7W0dmSP8kvp0UdVoDkSumbBYBiXSg3WaZPEY
Message-ID: <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: Daniele Palmas <dnlplm@gmail.com>, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX4nlN6VUC+Ipy
 f5SgOaTRHBWzwEko6KhNwMuu41WyO/Zhg+NicD+/uqkpK+Xb4L/DYJ4RFgidrQ6VuT5FLhEPAvV
 3A/DEoicZPUoIybl3TUUX7qoa+/Rh9t507kDpEh4yA1/7YoN71GWtKxtmTrNiL2xfOG6oGmKhrT
 T6nNKWj2KmjlUYlYBdyIAbTRbehTPwAHcBBG4AB7qRO51K0VBI7vw3g6dq2oCnm0hGwQldW2CUY
 2Xcw/0F/GxcRw2nIVD8Ii+di03sWZvHWri4GrPUFK+bfS+BwJ+qj+nB9hehKvRbCNy3azWBuSyl
 lOOidFUOnqTlV5M3xMX4GRoEFLPRSArhC+hgKYSE9BoiB3T79Pc7tBPGfrObOZTxKwc6oLlynM0
 A0nWZ1BkOUqhRGaFkyD9BNOk7vYHdh6aMa/1agXzmMIIRarPD8wd3vQsKQB/UiMeVQpC3JqxW6g
 Djv9HCLI5vioaMl/fYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfXwUkpy9lx0lHm
 fncqckBHuo8MsW5HnTg2lBl8SMyet+fr+7PQevE2HS52BAlj7VM1kgh+yGZze528ueShotuysXK
 mt8nC7i4mbjb00uPzQ/NZ6I9MjIB61g=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acccf61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=t2vznHeBAAAA:8 a=088zT0Ob94ooJFCwm_YA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-ORIG-GUID: lodU8RGadbNzokYyD4IIWlsuCMITpGTU
X-Proofpoint-GUID: lodU8RGadbNzokYyD4IIWlsuCMITpGTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120048

Hi Peter,

On Sat, Oct 10, 2026 at 7:16=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> Hi Loic,
>
> A follow-up to my reply, as I overstated one point and would rather ask
> than argue on both. (Adding Daniele, as the first question touches his
> recent QCDM ioctl work.)
>
> On the AT-only check: I said QCDM has no DTR semantics, but I don't
> actually know that. I've only verified DTR/RTS on the AT (DUN) port of a
> Sierra EM9291. I don't know whether the DIAG channel behind QCDM ports
> honours DTR on these modems, or whether libqcdm relies on it now that
> QCDM ports have the TIOCM ioctls. So I see two options:
>
>   a) Keep it AT-only in all four places (open, close, removal, ioctl).
>   b) Call ->dtr_rts for any port with the TIOCM ioctls (AT and QCDM)
>      whenever the driver implements it, again in all four places, and
>      leave it to the driver to ignore ports where it doesn't apply.
>
> Which would you prefer? If you or Daniele know that QCDM/DIAG ports
> care about DTR, that would settle it for b).

I think we can go with option a) for now. The documentation I have
only references virtual RS-232 control signals for DUN, and we can
always revisit this later if additional use cases arise.

>
> On the locking: I agree the data_lock/ops_lock split is awkward, and
> it's this series that made the two locks interact. Most of the races
> found in earlier versions came from it. My only concern is the blocking
> write case I mentioned, so the options as I see them are:
>
>   a) Use only ops_lock, with the whole ioctl handler under a guard and
>      mutex_lock_interruptible() so a waiting ioctl can be interrupted,
>      accepting the wait behind a blocking write on rpmsg ports.
>   b) Keep data_lock for the termios/TIOCM state and take ops_lock,
>      interruptibly, only around the ->dtr_rts call. v9 already limits
>      that to when DTR or RTS actually changes.
>
> I'm happy to do either in v9, which do you prefer?

I would also lean toward option a). We may want more fine-grained
locking in the future, particularly given the blocking write path, but
I think the current approach is acceptable for now.

Regards,
Loic
