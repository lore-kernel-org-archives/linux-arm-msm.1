Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC847140A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190851; cv=none; b=aHIu+/E+/4uOyOPS5UiIkSrSPyzPxd2IMsJvWxPa4Mr96nIpKAxZiyBRNFwtSA+MmVbbxjakmcDBt2nCLk57hnryK7CHzPHkct1nuwdcSRvLtn7NWzR9smbguxH6nYrHU8uRnB+k8EjC56rfPz8P018BA9ydttejP6UPYWelVuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190851; c=relaxed/simple;
	bh=huY5eY64RgAXVLfrgtrundlD7M0VZr9YqRrfGQBYvOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkDe8aJavdpq6PzpV1UIXGZCW3vTl3lND6U2jNWEwxa7hlvUNAp+3O99/xJzEb3fz540Ur6MKBuiiaArj9ThTFykRjzArki0O6tzHcMLnhccm4+gptMPMQTqEkXZlzx+5i/FYq07Lz/CTFhpYl70Zmvebrks7aWiPNK0mEgE8N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNHXb7vI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvilV3dz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNHXb7vI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvilV3dz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETPGe3703670
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 15:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cKuuSMgxM2H9+M8F2LZ7faXy
	RaK3QA/YjlRtdpAJio0=; b=TNHXb7vIWsMNX/89lhCMYKUPc8PE59+ANONQaR/S
	QqsqqMy1QuhGmLgikx0lmQjToFbNR7zJUKKiM0BljRJkkO50NqzbdcpXKwitIlFr
	bq1BGo47eitRSOY2ggvFmjGzD2nfv5f9nQB+ratbsIf7PGXA9UwKAYYjpr04Hd+H
	SasPHyAH475u/HabQW8GH/I59C95cUqH33UqvFKTzqEP+CkK74PM/awbVaFLghwS
	J2DHbTqQClwSP6Qxx1+yTWNtqRUzZ/f97rKB+tlHYuptCvAZFIgE0smpLj7S9Zln
	hvBpyfXOxara/K0mib/kfnsLRxcSu9g/GYhDsHOi7n1D7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yash5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 15:40:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so437963785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788190848; x=1788795648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKuuSMgxM2H9+M8F2LZ7faXyRaK3QA/YjlRtdpAJio0=;
        b=HvilV3dzdqgaYEBf1vIqz26Y603qUjIPsQvRMXMUrjxNufv26rXyBJd8Kf2JhokiHx
         zf6qFE1Y3GjGYgaqhfsrnzZWozXOsJWKYX3fOgZ+gKcklJAp5Qt3PRh9n4aIv+GuqCz1
         lx6dD4MDhFHxwYrRne/rZ/Yf002o32g/jJYW983R57TzPW6b9G4VTZthq7ZNBjcwbj9c
         Msexr2wPAWTXplFACylrjWo4kfMIV7pyrkhWEi0Wkkffr5KEjXHxOK76LZk+ifsZDUe+
         Y97PghzRCbVSV3EB0r7lUWnPeRNGytNY2TbiZnR4VpM/QEpThCThIbJhQirjrkQ+S+r/
         KgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190848; x=1788795648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKuuSMgxM2H9+M8F2LZ7faXyRaK3QA/YjlRtdpAJio0=;
        b=UqhM2A8P8xWatn7rrN+cq3vtJBdljO6LvsOgPtvmS42GCzgtooAkqHkDtjV1I5qSh3
         rLOmc0t2KIk4M+pf3xHZD0fun4AutE5yV+jbOAFtfvi7U+3iAUGOmND3S3i1JR6pb2Qu
         e89GzyO/R6OPeXlw8BTrnfr1IafNYJtlUkSB4KcXoHsFjnM1YVEzsThLrB31YqvUuRiS
         txPcRe1hE8E3OmrefSLff+20cFUmrhZePKKBvJ1CgBpIJ1f+ZXDTJHq+Q9D6k1Wt5jcU
         DfDSVHfdHA76kgGwcZYf8y+rmVbVyFF7ezRFAAU5CCh499Dce1ozF4EnpPuFpl5FYGwg
         Lx7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqPXsgqFL/OclyFjqLR3PtTCwR8wxOFQ1d6jNEjlOg/WHulipHvky9gS3l2qmSfyQKXkNHfEm+5DyGrIITE@vger.kernel.org
X-Gm-Message-State: AFuF++mB3tMgqg4Z6vuA8BA1AauX4RbY50t635nHkOKZkVSqnw3Wtewa
	LmvThESmozkAg/9XlNYMLV9YPvhi8sgqE/YK3yG+IDyMD3a7geHjFDiRrwsArQ1JZ2nyHsiYXTW
	0OpfRsULBKIKc6JeIjwFdBTxF2xgCMqW9bhqQIVK3apqcqkYvbFL6eJi7prsMhevAoU5s
X-Gm-Gg: AR+sD10/jvW3LPX78UlAtLvFbjR/5nOl5mx9n7T4G73NbJqHE7/MkrAek2TfKaxXUnd
	k9Z1wywfEdFhG/3LRreZU+EHCvkij1/PVN8fDxkHdnvWgi5RPloisNrjg73fs+5MZQ+wzvMpWc7
	acx2nYQDI10375QElU5b7QmN/6C9ClW4SguwFowwEEUmHP7sAuok7NSQ9IdZwl6sOumfWLaqrpD
	hoKyQKc0BZ7QUM+rsO7ndQH8e1FTyeJqQK8c1WZ20n8VWsGa84NWX9qNNm4prDdDY+RtcuEQ77+
	jDsN7nFumYkEtbZQaetsqUvsmc088y5UTTPWPqwEfUTK5CK1OaiM+7rkUyRV72Aykj1LvHUumNi
	40fHIZ38uEmCM
X-Received: by 2002:a05:620a:3947:b0:939:383d:f72f with SMTP id af79cd13be357-9394815afe2mr258470985a.34.1788190847403;
        Mon, 31 Aug 2026 08:40:47 -0700 (PDT)
X-Received: by 2002:a05:620a:3947:b0:939:383d:f72f with SMTP id af79cd13be357-9394815afe2mr258454385a.34.1788190846397;
        Mon, 31 Aug 2026 08:40:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm246034575e9.0.2026.08.31.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:40:45 -0700 (PDT)
Date: Mon, 31 Aug 2026 18:40:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: hamoa: Mark the EC reset gpio as
 reserved on all boards
Message-ID: <3jootu3zmxwjoeg3pw7zlbp53xf2hx36qyrbubapobgctjxu5k@lsxaphrt7hy5>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <izyaid2v5jpp3m4ope5lpk7j77bq2jlzneusfztawhnrc3ydub@mww3imhbgv7r>
 <apWXm0imLullON9E@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apWXm0imLullON9E@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX46N5MzZyfhsj
 u/crIW2uMbrBk8x5yCRQP/O2NFzm1s9KILXhx7dzLEWQxsNzRCyGHk0Nw4sB7RtUJpZqj76tiZK
 YwDJlpYooThGii4Skb9XpVNVu4JBJhI=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95a080 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jZhjRhsPoqfYPrMvjsMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX+S8MHO/iAmqM
 mmDBljMESNAknFACxq0f5JqXItaQ+CxRPuzE54Ik/fXiBDJnYs+Dn2MirdJKuqZHrOvNBbdBrti
 7L9dSm6/P27L06bUvE8QJ6T8SVHamAY6NS4gk3BtHDnOs7H/FC7yXE4hdUxOpSJX82d6OYqDz1a
 lgpy6MO4XUPhZcEBNVZi6nLL65H6XyTBPg+ZljPm5FScHzTFg8qAoln4RDKSJegoHa+r26Ga2Tm
 Cz6AU7wLUYv23CznIkD0pJcAX8YYhXR8QwYf+U6IQKfYQpVsRncb1U0qBd/TpJ2D19CU1KwvYUh
 D/6zZ9PwaUzrTkCzALD2mUljeTyhDjbZ6txZSGd/vSH7AMrL09Oxc6mykkrGV65s/WbKKN5naLV
 Meo0R2rWGoMmBEsBEHtrZwQt1n3AeHWASz1cmWeFLdA0vtreKaWdW8fwhnzUCZSP5Rf8z8EHkit
 mxBQMqDMh2QgJwvwMzQ==
X-Proofpoint-ORIG-GUID: qE1quhDtDaiv8KZ9Uf4xWPhcp4gQoCIz
X-Proofpoint-GUID: qE1quhDtDaiv8KZ9Uf4xWPhcp4gQoCIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310135

On 26-08-31 10:04:41, Bjorn Andersson wrote:
> On Mon, Aug 31, 2026 at 01:12:38PM +0300, Abel Vesa wrote:
> > On 26-08-31 12:54:40, Abel Vesa wrote:
> > > GPIO 65 from TLMM is used by the embedded controller as its reset line on
> > > these boards. Reserve it to prevent Linux from requesting or reconfiguring it.
> > > 
> > > I was only able to confirm that this GPIO is actually connected to the
> > > EC reset on the CRD, QCP, xps13 and t14s. But it seems like it is
> > > recurring them shared between all Hamoa based devices, so I reserved it
> > > on all.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > > Abel Vesa (9):
> > >       arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
> > > 
> > >  arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
> > >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
> > >  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
> > >  9 files changed, 11 insertions(+), 2 deletions(-)
> > 
> > Urgh, just realized that there way more that need to be addressed.
> > 
> 
> I'm not able to guess what you're referring to here. More devices or
> more problems to fix? If more devices, why would that warrant a v2?

IMO, the fact that the comment is under a bunch of filenames, should be
pretty obvious that there are more devices, especially since this entire
patchset is fixing same kind of problem for all of these boards.
Anyway, will be more explicit next time.

As for v2, it doesn't warrant one, but I was telling reviewers that I
realized that there are more than just these devices that need this fixed,
basically promising to fix all and include them in v2, if a respin is
necessary. Which it might, if you merge Alex's EC XPS13 patchset first.

Thanks for reviewing!

Abel
