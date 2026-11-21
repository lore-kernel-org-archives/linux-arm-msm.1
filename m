Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795284459;
	b=J5cAewNK7ts6dlpIkvLhaMubqaBwZLP2435hRwVBDiJ7zVneFhBq1jJsHEPqFxtccj1K
	 ibZO/m2Wbi8LqwWe55vGG2BN6TVfyy2aeE4ntYFtl8KIr3Dsf9FCmDvu2nTBrSxAEw1fY
	 Wqhfo7IU7DLa8OhxSyyihx7SMm7ldRodsjRuRKkJpf4TMXKM+UIVNUW+IonzXY/o9nZ4b
	 sOW0fhhFv4HNn3htWRMq1pES9ANeUx3sGItscFtS/BdnvbkSgnq49dYxBOpuwnnTwN/lH
	 8Uzvy6C2XbGApaHDtkWPC2YQ0rtcbomUKW1FdHh7ZGFfGeOGws4HVxFxePO+AX70f9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
	b=CWSB8ziYpzYtQ1uTv0VG3P89JygovdJmq6ezxBQb1T2rr9z030FaYMBe3XqJw0w3ZY19
	 FxxE4RdNw0VAdmAr7Vr8qeVu5XpoBA6TX0AEEabhQrW5f4L99KGWOZXPhmCaEBmRBu9yH
	 x26AmgoLDxsJoyo09khMzIIiUeFTjS1dNZ7zBtyAaRXH48KZcFEQPlQ37TRPFqQSogME5
	 cN4ys0Sfwr7PsOHoSSU9pGADtQYUkv0o7mH3F+m5L7S1P56JGAIowDSKPF4lJOKI9VbxE
	 qL0E6gIt/QZkaTpHbpgovxkv4PCUVJEMVxd0DEQuPeROmJopbChyc0RcdE1CYe5nMKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BQcb4RcP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBodHEvk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B15606A32A
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B15606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BQcb4RcP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBodHEvk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFZpTg1138092
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=; b=BQcb4RcPrA0xZ41T
	fJdYhnPNOIyBOdONBtGs2qXOwobbAkIQNULTlAp7Y73DLrfL/jX6t6fE1qndJD6i
	fL73upTrQtUY0p+sq36y5oP6+7wGb/4b/jqEfllxHYJ77GZ/IT6rjd2vvIK9xtZC
	zGHz39sdMakafwjEv9aoexfTEXZH6si6t45INfUWih94fgzyorvYnrOX2LqJ6PAu
	N0kv4bzLPjWSsqIRSuP5ImTVDbc+VXTCQBFD+LFE/4A7t39DeW+5T/9/FrStRKbS
	19CSSmmDF87zaUeTduodl9vPYxOLlbu0oae/+7vEwDYwPoYNiiStUWralHfBm2+C
	wAyccQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rsvd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:07:38 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0bf2140b7so27746197b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 10:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795284458; cv=none;
        d=google.com; s=arc-20260327;
        b=QPGKLCvDB18UJnO+E+tYmT0P67YExH7KheIcnLftyUNp9dBAK2ZJvMn/21swLX4nZK
         24Q2OdR5jvWYogah1FN5ONAAfw9D+9IW6mVAyH+UMeqEtmo3Z7YQsW/oIMaDzdHJz0Cw
         ToYCQS16hcRAmR4SBpeYUlB41znA+1ksCUi91oxwVveBmI7sPDwvJYqbTPnyH41RdRjy
         6Fjz1BbEPvIftDmqwPHXzAZjDuMYJu/MtGqJoqxKnXRrldKaFTG00KS7KlM8GQyAb127
         kJd9+7oXdGI4KAHlyCRDnkx0vtxjxJRP9heJzAjgX6tfyLvxha1m1FS9ZleVfybtrRIV
         Uqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        fh=QmQBZYigHgjC9IrukMrTIazzfTXLlubhKUcEbhI/U9Y=;
        b=TagKKEAVm9WkO4pDLpC7BHpOpzx6IvULekFeTxkZf1h7scl0BD7hCXKRoFTOyeCq3x
         AclQZUCFPnG0GVKJ4CjNQI4q+ErTxIMvvwod8Qs03uFb0+AGZSAdFgU73cIM9/Ik/AY4
         lj5nuSugF5nY3L1Q3GZUafNM946dbvH5YVpz9FcHEzNs92fTIeys1KpeAyTTaEq58ZUk
         W1r0ZzrGP3Sps+nzTJPWnhdpUX0cJecFYofkyxuDbFZNUxrNa1hPZteeBe22K3b/4Pra
         yHTK32n+P5zd5WOLnwp8feObvou31EZA8aj/kaKZ9lby8V+eZG1lAX1h1CG6MZ4jvpJ0
         PtZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795284458; x=1795889258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        b=WBodHEvk0BZVjo5i8swxkPj0JUd004VxJVFvWlfaZJAax4OfUv7X9WeUkZ2WB1i57x
         2TlA6ThLF2oi1nuGAl0QMyIVZlDWnVuBHvN9h7unro3uy3pPlYXSpF0/ABe6sdDWMRPu
         4NmGrewt3nJsSJkTh2N7Z3LZ4E+j1J0PSnoC2kUn71NLBol/m+aBOE0SQ7xfh+uj9qGJ
         5HTQXejiVCGGzhAm5k458MBI6Sqb2xVX/C9XfLML1eiupQqn+jf+YGcAf/Pt71aMZNip
         fU2GZR+Te+9ocUxE514NJKJV6dSLtizKm7ZJ2z1fyc7rQI0YDuYnBWNMXNdF/f7zninW
         59Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795284458; x=1795889258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        b=q7RKTN684cyRI02Dk5AyUpVTLZJHy5VmXDFpyuPCLk81Ew59G3ifVHnd4XEYaJyN7y
         CBxA831bf3q/HdiBuy7101s4iGy27h8FRGmGB+ubzBqZnNt28caoHd5DFeNjR8YVCAD3
         iRbulEgpqDF2aklzx7ub54T4wAE8W8kWblruSFu4ehlnKsho0DRTaY9vtZVDUPj1JnwB
         f4EXyASDK9TnBRkbTLsuGkNLNzXRAIVoE98U7eEkuYIP+2LFn3cGRJH9YtqJjJE/orBa
         fMF7CD+3oJb1gY+qxDty7o2A7SnHqTt4atFMmZqosEN5ri/eoFFJoyTTtqnrWNpX5kgU
         rL8Q==
X-Forwarded-Encrypted: i=1; AL+hErGdqyuaV3Zr+cYU8I9LJRJsFumyhyoCyNtukhAfY46+MjYU0tB835DSdPiMjSGsgkwm/AdXnBvAfun2RV0f@vger.kernel.org
X-Gm-Message-State: APuU4Z9TcqR5r02gIVbvlMRT9d1awQJOh23NSBh8/p9Sa2wfG9mkS7Jo
	vqxA8WIU8LutCSNaJqL3wLGiGi4NTg0uQrSCdwATTY5jBOsE5JlpcC5sN3Y/vsX9ezWyeNMiVxN
	O6wIXMRGvrvJHe++MiOL17FpnQD3l7DYB3rh8+udCzVZS3zAsf8TpXUrATSR4622gzgvIzdhprg
	ekwStfoePDoLBA+h2x1mr7K9uA821HX0ajS/MZ5heruui4BsJzUs0=
X-Gm-Gg: AZFdTZfAFxA5sCbL1GFzXKLgGSKx4vrwcnTiLbAnNi5kARq8+f3bGBd0nIE+O4eXrjC
	QoDziOp/C19bgZ3V82a7ekBrQccDguyIvCTszKEKgPrjk6/m1rCFXwkfbtpmyMtjyjw+GSzVjh8
	On7FEbnubtGzjvEUN/E141JZeTnHHURo6vtns9mvKaBbJUWoBu+Dxl/7Kfws/V3WqkICdo1uNOy
	Xf/2mEULDRhM/zGxOc=
X-Received: by 2002:a05:690c:2a85:b0:8b3:3caf:11a with SMTP id 00721157ae682-8b52032707amr33625637b3.4.1795284457744;
        Sat, 21 Nov 2026 10:07:37 -0800 (PST)
X-Received: by 2002:a05:690c:2a85:b0:8b3:3caf:11a with SMTP id
 00721157ae682-8b52032707amr33625497b3.4.1795284457246; Sat, 21 Nov 2026
 10:07:37 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com> <arMcL9HjfkCDNOHS@vbox>
In-Reply-To: <arMcL9HjfkCDNOHS@vbox>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 23:37:25 +0530
X-Gm-Features: Aa3M54rmkiqihd_IxYxjTdXdYkS2xbqhpvjtR45jB_zIKbtCgVo1zmRXKHlos1o
Message-ID: <CAEiyvpoeJbWJ_nLuf3Ws1SnGR7Kxg2QN75ruN5YKyMBLc53ZqQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA3MiBTYWx0ZWRfXwriU75h7w8gM
 Jnm+FYDamrffPWS/AP+fEL993dIYc5qT9nnQnuwwyivZQP/kEYIH8wZmeb0RcrGOf3T6jk+DQsy
 5z+7fhWNbCQ02u4WJuzo2Xe7CrXnip4=
X-Proofpoint-GUID: Wyhxj2K1VHaGDJgiLgtkY_lYEPITKBYU
X-Proofpoint-ORIG-GUID: Wyhxj2K1VHaGDJgiLgtkY_lYEPITKBYU
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b01ddea cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8
 a=xEoOTTLnucjJTz5eKE4A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA3MiBTYWx0ZWRfX4Z5uu3ypbIU9
 MFWmfiK/5lryY44CjzVG+dbBiKQ4kWEuC7IObZKi5HByyUOriiWR+yzsN4TxSoCE3NVxnMYfOYl
 jSs1ZXGzcSJrRbNHZSfM2b0Q6dqHcYPRp7MBOJiruEaiPX43ba2h9E5ID2crz/KucdmPHa6wdcB
 z9xoRZqY5Kwnoh3m4Hm8VU7smcMTOPWGFzhiRW5ajSZoMXqOuARf74J/ExzmFM7le1vUU5zbsus
 56UkQFuWjmB3p+Y/CGRCmrOdFi4O7iyWzHhusFxWqVWxFzom1S5f/m8B5wmjl5ph5t3wnTeAsJB
 xifl0ueP4HOEqoNcoLTvK9uQARE5hVhFMG46qUWPCxMEbAUXDqcMvc215fj2upCj15yzCzVUsmx
 WXIdtThHnWTNmefpxGeYkbDGKP7q7An7goZIS2K8/ZAqkufLv+T0z7U6JIxa5ZOIlMz5ZnyN4BF
 ps5korD86rZWRn+eYcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210072

On Wed, Sep 23, 2026 at 5:54=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Sep 14, 2026, Krishna Kurapati wrote:
> > DWC3 driver does manage phys itself sufficiently for Qualcomm platforms=
.
> > If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
> > exit is done only when roothub is being destroyed. Due to this, during
> > system suspend in host mode, although phy_exit is done by DWC3 core, th=
e
> > init_count on phy is never down to zero since HCD core also did an init=
.
> > consequently causing phy's exit routine to not be called. Hence, add
> > support to skip phy management by USB core.
> >
> > Some Exynos platforms still do rely on USB core for phy_calibrate calls=
,
> > hence disable USB core management for Qualcomm platforms only.
> >
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---

Gentle Ping!

Hi Greg,

 Can you help pick this patch into your queue.

Regards,
Krishna,
