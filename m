Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793075222;
	b=o5g5PoYWSFsuRmtn3uk81sOr9VbfEEd+MCLRouggrtaiKH8vi5Roa3uNY6BGHuyZqbjl
	 OmusRmufkN2TOI6s/YR/rmL3DHlXjvJ9uZYIwgu52qk8uxQluCPM3TH5HXVZmORlVXtmi
	 jDRQjfux9/+zfBXvFi1Yn7IylWEE0OX50jUXtPkwvhinAxd/G7vyCRCxbkrzWlvuptOTh
	 REQopsfAyYQkhOsAYLyWwbox+YrIpgpwQ9XbTXaQXG9EONedcTL4fbLSJjC/RJTplUfvu
	 9oYCTxsYy5cuH0uENtp91qQFdZp9fog147p4bjD9DLWEWCiP4y8e3eGcLfzjg3wJc5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
	b=EwxHAkmoX7/ZkGXJ8YIauw21KAGEBLoGjQ+2S98xv8qkuBjbT6P4g/MAS6rcofB8W1Ri
	 2KzhLL15zKCGLdRawQW7wfSYqBnk8/mkWnbAsmj/LVfCzpalbLakJxD3YUlgsmeb4QAG1
	 7uVUf+tn45hYLsWa87P1a1iWbukp8VB80/0F0u9t1vQMLzNc29qpOUFM+cDQa1BKyzaZ8
	 ZmImlnW/APMkKO8FrT4VWw9Bz8gf0jMNDAhvVmLpVhTjfoERD4VfbPWCO6BWevs+/SDn7
	 Y/EHZz6cMGVfdxs36YhalIZf/ke8RDpQXD/l9xASxUuCmQtuM85MldJzvslMeArESUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWdUgzXB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JguEorj1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0B606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWdUgzXB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JguEorj1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F5Nr1421273
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=; b=iWdUgzXBcnZtNJQ5
	49eWB9KnM2mby/Ra9xncGXEAhRUpjwiKpTbXVN4ctA+nP7FNDaTqVB+Np5I/2CRQ
	WWmtcC6JYZ6lSc1VeGB05ZZFQA4VkLoB4E8ZEbbIUUw+49EJbKMo8+ZB88dOHZap
	m6xyC8m6Q30X7Ped2XD0S4+UChoAp8KswWK7hoPtMOxhghr29dJGOUxW8hcQ4XPO
	KD7LerWeTdCw/0OYr0TUELNPzPhJiNUDBR4QqQkMuHpKSAkgIXyF2HGNlj9TCb7z
	ra+MPyL9MOAnO+uz5QRgmWS0rYMtw+qj/2W30vw0J7el0k1I2ntiZ0vLATHtkOdw
	Q2XysQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf3qg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:26:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e93fab204bso5011062e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793075210; cv=none;
        d=google.com; s=arc-20260327;
        b=bcDPmXMW3C+hNBKpZjqr7QHqDNMD4azxKBng08DwPc+yyD76l5D5GkGCbrrUyGF/hJ
         +WxcMufkaB63pXyYHAu+lq13aPrM6POi8FNDTfJDImjP2bULyxD9O+04/k1W4o3LT7OK
         dGxmgidN/thtQwW/vorxAnoeIH4gky7809wPYD+i9i9TBwHy+JHFFdNEu90nngd593PR
         qGU2krh/LvQtYJd4gaV9mpKo+N9O0EY3GsfE6BOpWMt9AAxAsADNRnH4YQzqX7xSPWRi
         qsa374laZqYawc1zxeLhed7EaMSPFk+tTyDSSaN5IzoXG5dsf26Q1a0uudiCDnFM3s4R
         cwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        fh=IczP5pc22ZdEj7qvP75S1P/Bfu0llQPcDOG6xYuQvm4=;
        b=fSygFyFGgX+NQqA2iUuG9Pc2QZlE9OVBK1UaDXu4ZyTWO/bVDEjJKUhaDxgJifjXAr
         1P5H8hpJqkqCZ6RcyXbiuFnMhMVGAV2kekR1AdXriRAm218ZQ88P47wgFbQHFMsNnZy2
         NeS35tZUpZpnUCYs+5aGXdi+L5KAUBx0moIMhVzVzrxGsA4mOa215MRTVYc46rVrg27W
         YNWKfPiN9DbaxMgKw5mG9EbFc1OkyMEzJNMnjeLtTp69TATERiPr2wAmnAzKEDMHG0aP
         MFH+Nuq2HbiDdPr+sB5+XWUFJK5JzFlhklkdN3jj6iUV/jAh2POmgGp1BdXGiIJLQCgo
         KGWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793075210; x=1793680010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        b=JguEorj1DYC0ZHzRjcu+h6eEsL20UXSswiEk/FQVzneSKbaiVmZ606RHkmkMr6HQkh
         xB67AKdZF7NaksJsaGwpF2ynbE7m7sfrtER0yPAhyWwUyJHNnha7wk55m1DaTqIqBLB3
         ewmGD0O01E+6Lk9MiMtIc/x45erEfkogNGM4gMgoEdqfL4taCm2tBv34NuLuNWeDwHma
         hNL41R4a1zG0XMhD4CkinKU238yCx27ff3TFWvLFtfrcrkVwE8f4O8vtQP5AeQXSuCWE
         /fr0j47R1hnVyD0KaIWCVJmPSCR08uxyiIEfgZnprlO9P2KwCsNPH8Am1pOSAD/hP6Yo
         ryBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075210; x=1793680010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        b=cP/jlrUm5aMJQr3im3tcXRvthX+8pNT2pddMHXIVLmI0nIHdFym6Es/IxO3kK9u0Oz
         Hx1juEFKnkTPhFlpYJfvRMcmAspzHEGLuUtNk0MKhTU/MZQYkpPKttguJ3pp23OH5qps
         ZovUGqLl4QOwxFnCv+V48FRuhlsmxphTtcWLZQpMzzC4YzbWgoh+6/swBx/7rMShmrUp
         60Cx2aOaTUqzjgLdmJz3lHUfVGq9LQU00sXnfylfmdyJnJOKhPqLrQ4V5N90oxvzjOc0
         qopSngW4kG+ogykZ5M4Z14YBSqB4npy1BmFBj5yrsjQNsVCL8hgjWIF3X9w9a6t9a+3w
         acTA==
X-Forwarded-Encrypted: i=1; AKwUvBw78YS1OMswc62Q1j21+iYKPpRZUEUdg93zWoq728Jfj/ERvAru9I53kmCr2F6Gzqlg37D8tWw5tXJn8UCN@vger.kernel.org
X-Gm-Message-State: AFq9FYKXKPoIeVUV1A04JcqNbXYy5a/MsSknGhu7JzVjLm+pt38LrcsU
	OsAbVwX8tattiPgkrisvqhWANbylBNE0nU6IGIcztZkxKUOSm5SBtKTzkVSW98rGFDINn9MD6DC
	bInyysTp56BfltiKumKlnKVLnBri3ZEJGzOPpFcZzXTbH4Wol86pjBV/WXxxgOu4NiBowGjckz+
	mAZPxI2QIeW+oV/fUIPfqwSm+r9xl/ij72n82pN3ExNhA=
X-Gm-Gg: AYBFou3FOORfew/z6uYfmG3DviTnek64GrXE/qiNlBtAMEJ9uhlX7xc0043mi33k5fF
	Zwl++Q6OyP4qhWvIIfRWABOSaCqdsAqGdRJYDEXRdrHdYy0JyhDaiIaimBRb/wDWU/ZcQbhD6g+
	V/3IAiOfF9IEPZWizMIdkLFrI2Z9lRZU+dtxrXSMuzAEs6V15zlIa2FOI3KTLtbzkC76pOFeKgd
	prh8bJTzxh7GH+W3g==
X-Received: by 2002:a05:6122:d1c:b0:5ec:a9e:d80f with SMTP id 71dfb90a1353d-5ec2323eb13mr3595415e0c.8.1793075209741;
        Mon, 26 Oct 2026 21:26:49 -0700 (PDT)
X-Received: by 2002:a05:6122:d1c:b0:5ec:a9e:d80f with SMTP id
 71dfb90a1353d-5ec2323eb13mr3595406e0c.8.1793075209303; Mon, 26 Oct 2026
 21:26:49 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-11-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
In-Reply-To: <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:26:37 +0800
X-Gm-Features: AclHuK8va6xRV24M9rgTF_POC6JkORw-Ok48zk8PcpaxNQ1oNylaL8QpCWYsZNM
Message-ID: <CACbMrhpYMs6CvAUzJbZDd4+JkpsUSoJaXHcF-A7a0wNoZQDhgQ@mail.gmail.com>
Subject: Re: [PATCH v22 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfXxOSGi6jrGWSF
 E7oT4WLhucsc9x6M77Tp2NiiFxzCz9B5sVu25CPdwPAifW994CrKsr1ET8mpLkvkWEgBVBTcrfH
 fghLPEfac1+agSuCZu+Nw2MdhS8OMtQ=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae0280a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=6iLt9ATBiMRDfCnMGdoA:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 0y-nN6AU4YelFlOeKpN7VefL78XvukdM
X-Proofpoint-ORIG-GUID: 0y-nN6AU4YelFlOeKpN7VefL78XvukdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfX5jTE75xNdmou
 NYQDMgQEOSMOIsiGN56Ws8NwTpqL2Ok/Coq1xhEFDSKf05RKSv5ydF0IiAaP+m0ypsjq40yX63k
 iAq8Aw2TYMYj5+ZtrzEtAqlmmqLiDEgp2y7IbWLQ5oM8Fs8m9RHYFAh09NwCZs9sF3FoLLGadJw
 +liKfqQM+Dx2icyquW7obS+mnI4BtkkHA4qQ24BCsEFjvwy7GYD4tRuEO7UHLrgwSPH9bJB1eDY
 44UDIqK/HBt4+35GHL/xZQD7piCFaxDXdUCdnSqHxArB4KbekGty1JjbOjMnmHVFgdbPLSjb2T6
 7CNxNqZdARaZ0oLjgC5qFmviIS4l1ZM3/Tla7Jkry1zri6t4a13kWja+b321r9BzuABe0mxB07s
 HF0vAPNX8cgfCID+ITmHsA1ytXVljnisIEMdnxZOco029MXg9vhepurCaiz20CB4hCbj8KCUTHT
 1ldqRgT0K7DRQv4pmJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270017

On 10/27/2026 12:29 AM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelin=
es
>> can be enabled by board device trees.
>>
[...]
>> +               camss: isp@9253000 {
>> +                       compatible =3D "qcom,kaanapali-camss";
>> +
>> +                       reg =3D <0x0 0x09253000 0x0 0x5e80>,
>> +                             <0x0 0x09263000 0x0 0x5e80>,
>> +                             <0x0 0x09273000 0x0 0x5e80>,
>> +                             <0x0 0x092d3000 0x0 0x3880>,
>> +                             <0x0 0x092e7000 0x0 0x3880>,
>> +                             <0x0 0x093fd000 0x0 0x400>,
>> +                             <0x0 0x093fe000 0x0 0x400>,
>> +                             <0x0 0x093ff000 0x0 0x400>,
>> +                             <0x0 0x09151000 0x0 0x20000>,
>> +                             <0x0 0x09171000 0x0 0x20000>,
>> +                             <0x0 0x09191000 0x0 0x20000>,
>> +                             <0x0 0x092dc000 0x0 0x1300>,
>> +                             <0x0 0x092f0000 0x0 0x1300>;
>> +                       reg-names =3D "csid0",
>> +                                   "csid1",
>> +                                   "csid2",
>> +                                   "csid_lite0",
>> +                                   "csid_lite1",
>> +                                   "csitpg0",
>> +                                   "csitpg1",
>> +                                   "csitpg2",
>> +                                   "vfe0",
>> +                                   "vfe1",
>> +                                   "vfe2",
>> +                                   "vfe_lite0",
>> +                                   "vfe_lite1";
>
> I think we should probably start adding the CAMSS "top" register
> region as well, to provide a more complete description of the CAMSS
> hardware block. This register space contains, among other things, the
> CAMSS hardware version information.
>

Ack. I double-checked and found that Agatti, Shikra, and QCM2290 have
already followed this newly introduced register layout. I'll update both
the binding and DTSI accordingly in the next revision.

---
Best Regards,
Hangxiang
