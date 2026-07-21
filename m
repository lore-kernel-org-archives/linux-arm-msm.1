Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3703FF1B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598718; cv=none; b=IJ1LSy5r9zL4xPKqbHuNEwdTullgrFvTUwBvarhZ+1ThcFv8BzMMXMAUTOaXuIcZh12MJ9NnrTergBD+AraXR5Tq/ivVkerkReEuXN/c+MdYpHZuSDfdJle3hGLKVgUhpNiF/ffPjxzV3fuOaLJGAmQ39OjiJfieIMoSP0pyoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598718; c=relaxed/simple;
	bh=UD2pWwm7Le2tlxHA9aRPkuTZmiMjQt8StTkl3lqpaeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHYT/l2Lv6XzrZKIhsI0TBiEgpqoTFwxrfzC4dOvVnu665Po1sdxl/1N3c2AQJxn0JQfLs1iGDQ2XkmLCXZxMotULarl+xsztDp0qhA4OGr5uWXwA5qt7x/QjLv3q7yDKJs1mrArQtKHDIFGN9q36nsqDln5mSqiy9JpWjE5neg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCYyKhTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/KvzMCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCYyKhTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/KvzMCO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCoJF3854880
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B17MRcp2k+DsouMX/N51t0TmocqJVKGYjSpvwQiRJVI=; b=aCYyKhTP1slIbela
	patlwK2yAT1VHKjJSRebMgULkSbrHbNSr1t3XKF3lmmak7V9cGkjEZBcR1Afothe
	funCrHZexOsTJcHUqgtzmUgFkXmkzT7QhK7YE7k4Jbby3L7+K575ZrQPWDvoVMYN
	Gf5VKTTwZEbBLtMpgj5CfY4W9J27MMb3kaFMr6qpCvP0lOHZMWCEV1ts+G+SoK2W
	slfhRtqJP2SC20ugl1Kb/toUHTrFrbjIRH7H4tyianDpcr+GNfFqef70Z15BeR+S
	mBrfTK+4zMa1KHIKPkHu3DolGnKguXjI7pEDSmUvjj4rHF8461RAx4Jp/NhXYe60
	DjFYkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs03tdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:51:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7ea29141so48665925ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 18:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784598715; x=1785203515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B17MRcp2k+DsouMX/N51t0TmocqJVKGYjSpvwQiRJVI=;
        b=K/KvzMCOFzXxUw47Fx6h2duXJXqkeY+uNW+hd1BMrnWIeKjh5vU9uSHhQLBu2i2kbS
         LnDdyKeZ4wGCCCiFJw1wkoNo8ALj7HesaEub4bGGu+4004exrqBfE6dlx4Lg9QrML/vf
         VJGQXOL5riHfYsoXJH2OGM26jN27bFvPxwa5kCgUTDw+mpFHvkb4I0muU+cbfzjJ2jYG
         oZxOkc3QsVscTf5kJ4eVXy5QM0GbWbMQ9JMAnn6EXT3OqduugsGDvOqwoe6HYRgjF8KL
         IXIITnJv3Q01p96nuBnckj9Vdeji/rGnN1/lMijC/Qw6ldcjd0IdouIcJkpTMra3d0Dn
         3nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784598715; x=1785203515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B17MRcp2k+DsouMX/N51t0TmocqJVKGYjSpvwQiRJVI=;
        b=nGU+CPJUf6G3iTF6epykqljhkLT1sBhlap9lK/3+zhbptQy6Zk9imclEqT4XRVaL0c
         N896Q+xoTCsXfdsdq5Ntwp+rAn9rMp9l6FKZVaOyAP68PsaY7XYNA1dUtjeSfh56fUox
         bTz0xEFmiccK5xcF9Rk1Q0XLT5CsbMmFApCX8nCKAzWuW20Whf32ytlpyxelKfbc/wKV
         Ga0rkaTeYmD/bgYufbRaQb/Z9J+J+7+zgHygeov3b0TUaNE6meoJ/Kwux1TmfMedJ9MY
         WIIg7dqhhxiz0DOchQw2DhD8yvnCZqjwnKRBAUEz1JyNw6+hPEUXeWBc+v0kO5a0DQF8
         O8+w==
X-Gm-Message-State: AOJu0YzveLF7JuzwYFf8FJuVVgOsqkPrgmSW3nt1hc7LW+T8vO90NBLb
	A49rLYWm1Hy6n21qHADQO1v3hwQMBVkdmYAVXfGWoQzxwC+tL+K3bFkQPrwO/ahQ6l8DhCagcDZ
	xeEZZ2gwbO3Gj2Qc3PpRMI8Iyp8Fa36/88O3Zo84oX2BXizpm7EsgUAVcp2AoqyrbCfye
X-Gm-Gg: AR+sD13SiL0a8cvvfCp03Od4GkgfJ4H9EC7YtdQqH0hajeFBOsNBbjUOgl3ig+TfD1V
	BJKGMbn2LOYmKGwSVnK/V+pp1WY/k1kyjqu4/i0xSoxcTFp1mu6UW4oBv3vOevpXISrAcS78haR
	IcQPWHTrY608VZUg3jS//oiCdBntg7EJ5PG9dfyWScGJBet79/lK7fZTbx6JJhnWHe8OymUPdlD
	4luwJfLIhLQz8cEiIxpVfbuwWiSV1rgkdLw3mURY5ijpf3M/wRzEKUs1922DuC/Al61MeZ1r97k
	QfzoSJz7UKjRsbZ6VFoIJTfrdvgMBVzZ2+b+cZCAXX2w/jSB0yjJRYX4rFAhiy3OKcuydbAmyoH
	WqUYDZ0wMXukDkQhMlj7EchLgZ6A1tcNjrcjOYflyjlM2S6YRY3Y=
X-Received: by 2002:a17:903:b88:b0:2cc:e3b6:f305 with SMTP id d9443c01a7336-2cf349ba609mr133376335ad.4.1784598715000;
        Mon, 20 Jul 2026 18:51:55 -0700 (PDT)
X-Received: by 2002:a17:903:b88:b0:2cc:e3b6:f305 with SMTP id d9443c01a7336-2cf349ba609mr133376215ad.4.1784598714602;
        Mon, 20 Jul 2026 18:51:54 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm40346757eec.13.2026.07.20.18.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:51:54 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART BT variants by subdevice ID
Date: Tue, 21 Jul 2026 07:21:50 +0530
Message-Id: <20260721015150.60198-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMRc=MeowD++93_eaYSBp0mKoY0nRROLFncLP6Ec_TdJn3jJEg@mail.gmail.com>
References: <CAMRc=MeowD++93_eaYSBp0mKoY0nRROLFncLP6Ec_TdJn3jJEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAxNiBTYWx0ZWRfX+GJCs76/2h7o
 jrIyDldctIh+Si4FDDf0zZHQaAE3vXMrufP6fdcHWJs81425m1Lc+q4nXjxJwmvF9QjA49Iq4Xx
 iCeTUnBo1s55mT6FkhX/bANEF9XlCow=
X-Proofpoint-ORIG-GUID: l0ZYhpDHMd_D6ayAGks7SYAVHPezNRLK
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5ed0bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=6OLaB2FWHzg5-YzQX7YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: l0ZYhpDHMd_D6ayAGks7SYAVHPezNRLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAxNiBTYWx0ZWRfX+oxjeEIp/LPC
 ibbnQe7Ef768AbB3bI08m7eHP3Q1T3w7zijpFbI0htzqjkiOsJTDILRbTBjjGmSANnfZGspqDhy
 xz9P7uD28GIYjdmaZ6kSk5iqpvYWXD/IHS/002s0j3Bi7MLv73cyiVlJOzH73N+GYeDLe05oQ38
 6PCUT7lV+d0gCD8PREcwV7ZCcZBxRKrWBmcy/FWOJU1kQRVZkBnvfx+oV3mp16qmXGKl+Gz26uz
 V6nLm7Ls4PXhxjxEqAtwqZIzNp+Jpm7aqmU9bK6pS90JZq/w4ktBuJCntPu3KP2+nC+xUL+RCp8
 Bd5a4eo7FCNEKNL1jGGtIDbS5/1i32ltn2WAx7Nbdi3oyS99Nd4Lyh9cKAE2sknttqymJaCWdqG
 baXJKqP6sc9n44dQU4N42SGXfj34PEmWYtJpODGk/p89Mo8DWciGKK27XPfPT3WtZ/6ixTVxLqZ
 hAcfUFPR6ejZzfBqsow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210016

Hi Bart,

On Thu, 16 Jul 2026 06:56:36 -0700, Bartosz Golaszewski wrote:
> On Thu, 9 Jul 2026 09:29:41 +0200, Wei Deng <wei.deng@oss.qualcomm.com> said:
> > The WCN6855 and WCN7851 combo chips are available in M.2 card variants
> > that differ by their BT interface: some expose BT over UART while others
> > expose BT over USB. Both variants use the same PCIe device ID for the
> > WiFi interface, distinguished only by their sub-system device ID.
> >
> > Narrow the matches to UART variants only by using PCI_DEVICE_SUB with
> > their respective sub-system IDs. USB variants no longer match the table
> > and will be handled separately to deassert W_DISABLE2# for USB BT
> > enumeration.
> >
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>
> Do you want me to queue this independently from patch 3/3?

Yes, this can be queued independently. I'll send a new patch with an
updated commit message — the previous one mentioned "handled separately
to deassert W_DISABLE2# for USB BT enumeration" which was tied to
Patch 3/3. Since we are dropping Patch 3 in favor of Chen-Yu Tsai's
USB hub power sequencing series [1], the commit message should just say
that USB variants no longer trigger UART serdev creation.

[1] https://lore.kernel.org/all/20260715085348.3457359-1-wenst@chromium.org/

-- 
Best Regards,
Wei Deng
