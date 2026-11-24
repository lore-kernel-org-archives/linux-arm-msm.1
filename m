Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795522816;
	b=Sg47DexsvE9YAO4TUKQSFSVBR8msgamiriKY4HBz+tBjENH14lAu34/qHmwfYzsHRqlk
	 DLKS3WMYw16jz95Lpi/S9gtplaxf1sj/PjoIEFH4grJMDqymR7zbyXp1GGskEVkpvAU71
	 ux+Tslvu9QpNxr/eAf8B0fMzP+Ka+fU7Ryxc9BNQpgDMp26rf1kdAN60OX3j8eIRErjRu
	 Ez5wKTlTDtXQNtbOL4vwM2YgGMvut0Ov8ca6mOR5tMM2CeWUUqARf70Bv7LkCqIP+tkpE
	 qQHYxqCi0OsNTB8fOPjEqtdzYuGzJLG+UhM9c8JlM+EG4LuKHJgVcEE5qDTb3iCEViw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
	b=tbVEjsOEl6NRc+QuzJH1+Uq8ctmJ8GSRjzXpOLqt7mysWS6ayNvMh7Y+XjaxqnR3njaE
	 17BAFh8Fn0AXFNsp7XDPIge86IAU210m5559jDWNX7ZHtN8B6EDUrYq1G35+uRdLOX9U0
	 23K0hnvQ4L2i968bqE5zU5icvYTfR0/UJ8cDW3RXPsOUVATmh7RLKcSoLjFBh5i8G+1qw
	 QPyUyqinmBXizbHcAtiV9PdumWDuCLy3KMkk+4TS0YGgTBPBUhRYQ6gWiSDYc9Kccx4bu
	 qLC6Ut+mgivTI07X+sdZCTPTbeDskzrrwKGUDKlv4by63JOmzVMau+8TEcn457U1hdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kov+r1Qf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq3T142L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FEF606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FEF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kov+r1Qf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq3T142L
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuiRu1291480
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=; b=Kov+r1QftyYH8jVC
	ajyBFw9xfcFUWym0xUhvCQugPqW5GDZBQ4reTqVxtrPbxtaKIINvSY8i99njlFcW
	5LVYJ6JhL3eQOO2YJ6/mnqS5aSZOIuk9GpdEl40tWAGYCGzuKAzOhNKcWHSo8khg
	VTLQ/hIT23fABK8PwKqDcvyDnyOmEsRM1WgGFKr+R/62ytzjLgwe4HXL/tlSJ1j6
	KshTRS1ofmHvR15Sjr8pUsmpbQk9j+8Rj1lmdpEXw9BnxwVs9P/ZTMBor4nVdKoy
	w3uuBcbZcOHbmz6xGhK3kgmxPrfezM/8CWz0vK+pspCoqcQNxOrIldAlM/wbM3sA
	HC+KnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbn0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:20:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so820092885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795522813; cv=none;
        d=google.com; s=arc-20260327;
        b=HJBjlpq8DvId5ms3g6G2rEOpyBHVwVKtMrPDtfViG2+zqouWWK7RTKZzNn03a33qQy
         g7r+ewWYF5dp+nWobFGToLSJ3z3S74PWQC+upWV8fXTvoAqr59b9GrthQHA7HSdsq/tW
         NW6Y+n4Dcw2qfxZ1ybLdMZQmv3LO7EoQGe+0MD0R78lcM2x8iTob1QPdwHa5VTYG2680
         f7T7764rEr1lLle+RtdHE+d+npd39Mi3UcGnh55GtDI/bn1b9afRWoEYzWAAcUG9AUII
         TyZM3YaTyMDTWqJIXp8kVGXNNYzCjglk+AUHF64utxT6HF5VdrzfGv5Ny51oIsfxS6Cl
         P55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        fh=ofsXUD520sJaRPoUHxy6mkHhotoDLEH9QgkuVj/KH88=;
        b=PNgqbI8T0gYfNfJvO2lojzH0JwOGGlb6WK1lZDsodGBbqWuiL4AB+HOVV+tyZrwLd0
         FqZYtk482/JG9yeTZIIIACAtkSyypu6l+u/nU2Oz3iFBr7pac3oMu6LU/ihZyI+IhICG
         O37jSPogt7lz0xDWQxepH+brrNVwtaFOz7pMq8295/LDQDoY6Ntkbo9zHttVGAxbKiOP
         hI6poau8aGO9ukXmOf2lX6jhcXaoh1XtABldX5QR1uVrv5JTCmA0JSYMfje88Lg9+gbb
         ogZOTIYnS0gdhqrHscUDdy8ps7LeV+fGsEVZ+MolZwOWlTovbjZrkQVUnp+k4cG/jbbh
         EfpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522813; x=1796127613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        b=Uq3T142LKQPjbCOfDd1a+BjmbQgQ4kQXDVsgVmy2CSd5ubQX1Ez48OkbtTNIq/0DKU
         jWyuA13VUhJoJyC6l1QsqDLsimjb5OcmRFwQtNMxHrnU9ZAHwrdIgiby+gWR9OmqaOVv
         KqL00C4VqSe1/Xbxg/9qZgHFBiv/D6YOkQ8XQ29kmFWS7149Wxqd2D82JV0x1Js1bGm4
         PGTNu8rd2DiPR3XdgHfaFVAkGzyoAGjkTshnXhShmAa5xmhA6lf+XRZqbC3ocRw/wsfO
         r3v+Twnlo6Un8B+XRXqnu3IO+4ffamrsUHPYxUjpsRt+ek6tgZIbxL7r5OOSEiWq5i1v
         hCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522813; x=1796127613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        b=X0oLSc6aNdegBpp3Hd7yWe1NLw036A3O2Bsb3W6EEViVdv/PMe7PhGoyXraaPesbwD
         7b3qVrbZrqvUhy+Ez1Ja9suEUyXZam3Oo1I2ZSIJH1rVQrGPgdGQVDPG1OLiB+QtdH+i
         sCh7R2dav+oorOqWsd4C+owWOk1T+YKOJqR27BdCd5BVvjlDffJwf3MHT7MpRh/WABH6
         iQqT5oJhdijEG7YzTYz5xBdAT7U+WoelBxmgtF7UG69OkevZO5w1HTe4CAJQ64HqSi/B
         H+pWWho2fvS+XIvvbzYOxRjdQfT3SD1hZeDvbtPmmxejsD7jcmbjfs3yXmS2qJuMD5iF
         2P1Q==
X-Forwarded-Encrypted: i=1; AL+hErGxRjOvuQP2q8Pms+byo1/ODANa5O7yeUJDIJfgIqY6lOEZKjoYRUNpattkU7Q3+Gvh4VeJzUBAYBihRNgu@vger.kernel.org
X-Gm-Message-State: APuU4Z/PX9UjYM39bAaPZkr4u9l8VSUssFNj2wj0iN+13tsEtqT8o+Xr
	xUxmLort8oAwsI8QN+g0p32dWYSvjdwrES/HH2bFzpCswSmwlMAncnCWjXbJUrx7IUDkWbDFeMP
	qBCGVLZ0HNtgqP/x6JWhBb8gYciBsIR39Cv0Qx8eG7B0rY10nL6eRQ+2XXGv73/owyEW2+0VkOf
	emaPylCaxby46i0xgTYu7idodVGDIs8NPdgBUgrxraDro=
X-Gm-Gg: AZFdTZdbDPD2/sdwzwAi3X9A8XDG0RsdKaeQhKiWP4A77qdKX/yN1pVKg89MAD5A8TI
	E9Yqh1tnqBEBFMECupUhpqjc3nEPi5m5krBIpqfLXwK1wVPVW3qpU+Z9CYGOgdITQ8Ajqk8n+63
	YpDaqS+DBOj4Sowb9EIfQB/kO3Tiz8RCVtVeAmkrd0cVp+XEKi6RCFIazSMy8FgejXJxoVaMccF
	a1ZmL7HWBktLuRF5FE/DfxXNaQPFjJWznkwCsTZHIiM/gTW/Q5KFmQZ2QOY+/Rfbuv+d2u5gn0=
X-Received: by 2002:a05:620a:6c88:b0:949:3644:edc0 with SMTP id af79cd13be357-949ba9c6825mr2317507685a.17.1795522812698;
        Tue, 24 Nov 2026 04:20:12 -0800 (PST)
X-Received: by 2002:a05:620a:6c88:b0:949:3644:edc0 with SMTP id
 af79cd13be357-949ba9c6825mr2317501185a.17.1795522812198; Tue, 24 Nov 2026
 04:20:12 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com> <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
In-Reply-To: <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:20:00 +0100
X-Gm-Features: Aa3M54pX1s8pai2gj6XcjiFfq8IfONplkCIxIiTV-7ktwGrAeuzyti2xMDsPav8
Message-ID: <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXwQsePwuv+2M6
 DMnv0EF0vfTO/0e/YmwyphWW9ORTj4x8YrmPmhq/UfXmX5PucOHcjZDhnjNL8QLEiVqLYdGg0cP
 rexv7702dfRo/aAHFnlq6k2YsGiD6Jw=
X-Proofpoint-ORIG-GUID: 3afoQzEDWAx_Vt-g6j6cH9ldwSOgCKMt
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0580fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=ifR-Ftivm_Zkcip0b6QA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX2M/ax/cL5Llj
 i5fRhnoRJg0j9ySJiE3fyHKB1pCh4rDhQ04AqmBwt5GM7kPTOWO/zmGVxEULCarkUSz/Mfos0Ig
 MmWhzs3iwYxBJW4Y4T+VS69ueAD0wnnxZfOTOpCQPuZLcV4jP2AF4ChJVtMCiZWk/EwAHdhOYrn
 Rfyz/Bs5qGL7I58xLY92hgTjBG71ManLfarPp2Rc3VogQxzRqD4TCyq2OdwF6ToDEEvdA75xGOI
 Bj30bia25gUj3BRjKkxt5/CmpHyB8Cd9ds5OJaFNm6D4AIJKpJ/HqnGPh7QYVflBwdqfEIEX9La
 9Iqf67q+JEAfs7FJNX61fUa/pKFVUyUxxmcQFeMulQImGUfjraId0M/8VBShofLXi+K4GyCsNf9
 61UExKWC9E5AXOaQeZyrXxfngQvmoyy3DWJGfCfLAnbTjr4C5WZ0n0CetVaXk3b5Fd+hXZJy4Uw
 g2QyCsFI83GkcS8LF7g==
X-Proofpoint-GUID: 3afoQzEDWAx_Vt-g6j6cH9ldwSOgCKMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

On Tue, Nov 24, 2026 at 10:57=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 23/11/2026 17:16, Loic Poulain wrote:
> > +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_if=
ace iface)
> > +{
> > +     u32 lo, hi;
> > +
> > +     /*
> > +      * The pair is latched on SOF rather than counting, so it can be =
read
> > +      * one word at a time without tearing.
> > +      */
> > +     lo =3D readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface)=
);
> > +     hi =3D readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface)=
);
> > +
> > +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
> > +}
> > +
> >   static irqreturn_t csid_isr(int irq, void *dev)
> >   {
> >       struct csid_device *csid =3D dev;
> > @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
> >               iface_val |=3D status;
> >
> >               if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
> > -                     csid_sof_event(csid, i, 0);
> > +                     csid_sof_event(csid, i, __csid_sof_timestamp(csid=
, iface));
> >       }
>
> I think a callback in csid_sof_event() might be cleaner or some other
> way to not have to replicate all of __csid_sof_timestamp() for each CSI
> decoder.

I added it as a parameter because it is provided in much the same way
as the sequence number, given that the timestamp is directly related
to and coupled with it. So it is not clearly obvious why the sequence
number should be passed as a parameter while the timestamp should not.

So yes we could also introduce a hw_ops callback, but that would
ultimately require replicating the implementation for each CSI decoder
anyway, or having some semi-shared helpers.

Regards,
Loic

>
> ---
> bod
