Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDA048CD55
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781654; cv=pass; b=GEaFaZKcCc/D4fmsJUuP+841zaYWoExysGyH/j+pOwkJxCCBSNDGn85qhDU0OU2Dj8vIhR1UTndbHAE3QTO6ggdgIvmaStkkBELc/VCRJz87poUsbbVFNULQ7KKwev/4IfXvrU2br9NWXFKcDEyHB0aNNvcIJc7Bx4Ou8K1JwMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781654; c=relaxed/simple;
	bh=Wer6SSG/uDE6Ee8Fljcjhj1Fc9lWtsOpuA414gbFytM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5y870W2MVvAqkt+yoEc6GxqT5qebOF5rPMOHTjTEwJmf7DbBbH2Z9j3DLUMsWh9mCvmJZXuNgBf8ewF5ZS67C09nkvDTjs4KevPztgsLOWZGwii1Z/3d9rhyVjVnDzfMPD4EzEabltjIdxkXEoAZaEQEQWcGgRGvhE8yUCpSnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVh+6URp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMEAMZuI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVh+6URp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMEAMZuI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmwPE810024
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=; b=KVh+6URpAkw9KsmP
	irbg8XvFBh9A6eBx989QXAL13WlV1Jrh0mmYPZdj5c01TfzI5xEL674WJwhfe/jb
	OUAF1Vr19KYwnmcSyjRMXKsxQSN8Eki9ZmSKwly25d8wWP0yCrnERjKfhU+9MroU
	prIf7hQRZvLYIqHCoodMOd3xbVg3LhDZ7fdV3HctW0nwhRcCI28jcWO10KUi7QDo
	zwJEogawHXaLyFiJgy+m3QvGGkIIyLD96we8/PazWpLwlWmaAo7pC0I++u9MsEmW
	CT/UDrMsb34cZOdGk0moA5xFjihWv1A2af3GDOcLHXLBRxtFA09DbYaL3fVux8C6
	i03mMg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua97u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:47:31 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66f7d131b55so4777993d50.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781651; cv=none;
        d=google.com; s=arc-20260327;
        b=gCR6/xGO2wLoroU4QeTeYP3u7rYX0JaQb/ABfV06PCEMZO6o8/cCjrBZyR68qh5GcE
         GLmaGzAKlIu/A1cDe1TRs7Qhse2OQgymJnCqv0DFJnM17snvgDCdfov9V2RLgwB2gx2r
         dW6fklTMBsIQ5AWCygA7R9iHtRhWQsjNbHRZEDlxNMlC662JyYF9nSzKcizn6uQhFvQs
         PZ+QuswrL8WVbLRvg3uZd9AOBZELwdW/i26O7f2Is+t/KZAqANB+zSrNL0UDJzGOKg3g
         is3QMHqFvaO9EpsbGmY5ubp9jfoC8pj7cXmRJDSld1WbEWQar9OwocDBzX58W3HWKmBU
         okQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        fh=RVd9u7f3RTBzLsLAn/T0qxM47DawBemhpE0wXnNpcYk=;
        b=jMUQDXwtxESfkdydAySnRBcZHbZ3vCAhCRynCSdNoiY394DxboOVTwj18DV4uuRhVF
         5OQ+LablMWRUSb/b5kFjD5d2fhO7EyCJ3EyKKjc2ZRJ6//TAj69DoOngDPgNP3fOxo2b
         8JuBgF5IbtMlEGYjBkkD8aghRUZK2F9p9Az+qlW6F03tkZ+FBoF/VIxeVmCB5XQH420C
         Zt+uf8IVshPJR8gwLF+Axzb6PnpKYr9FBqt4uKHUsf2EYphotC5O3PCSrc085i+YlSHC
         j2KQrpclvrngsBbfrKe6aTqfp35ujHiuFSG8J4U29zW7uhGYyfC5v4veygrx3ilUYeUv
         zINw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781651; x=1789386451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        b=TMEAMZuIT+LoJN2NefwoKobwwgz8IHx3Pz9ypLAlt+KzOSO+WWA5SKIbwPGvQFaIiz
         EuV5z6NhFwed8jM4Fo0DazGqrALOTk8XTL79OveVX3CZxDvBhJO/RaEvgc0kUSxhe5Rn
         ZseR4Rt/50I++/hiVAuv4sY5agcEjGx9GV4UGkasgt3b8gm4IV+jjqeSsorzO1Mv69fG
         Dyk26GmTx3IWJ0qB5OvlsgqF6uqrv0x/D3EqdeAEQblrTqwlELVOdhexUWwDjzE6FC/m
         sEuKq2ObZAYVOusjDTp34dhKn8pzx2gRyWeM1e2bHxKpmv5HmUS1+xiDB9FTRL1Iy5Mn
         qEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781651; x=1789386451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        b=az1t1L1lQiEmtsQttojixn/yTx12ZKwc6VP/fwgvlpw++Nzw44gjNygBrd1y/a/U4d
         9lixzyshroml0/iavfSOyWmOP4vjKDHj9mypV0PfFEkveroq3o6AWb8Tu+UhxwbwXyZj
         8084qcYlkgByuF+84Ko51n2hsRuXglo6TD7HSnfFsDPwKdhOSbjwuukiHCHb5XPvn5cv
         SuQKJDBXHHMVtGEKmJdx2oCDjaXGxvHBGJDgpxV2/aL751Zau3/z5uP5t+a120VzxNzB
         r2Yc6tAm3V3/bvOMI1vthhfh4/bNwEPNpJ6Hrmug6FUEhcVrFdjk+BV8dRXGglt126ET
         uIRw==
X-Forwarded-Encrypted: i=1; AKwUvBwVNNloghXnUMVX+BSEjbS4qZT8anSPe8qeZtLtoGSCsCJo/RIvSqqJUYdgfKbUCzqHTNzvBhvOrIRUYsrU@vger.kernel.org
X-Gm-Message-State: AFuF++lcaMMBW1qM9GyIcpsxUqdoFnWHRdXgN3nZth76uHTVFmp9uzuZ
	fssu/X7hzDEKOU0sU/aHS6SJ0J1wvM06Xs87CQKxC+vPuhj7Ty4INN0zyNShYdTUucKSGrxnoxf
	wqLUzYBs6/5qbd9lR5pkiXjp8AnwlAFhOV0HrhIBxzeyAnDziecr4CdtBhHxfja0LtQbp+ryYTR
	ar+ombvNMgPiWY4V+11pEnJnP2TQ+qEWusVv4F8VtzDkw=
X-Gm-Gg: AYBFou3JkYowLBqH1i5HuL0PaJh4jNjLsA6GIJSE7Ebw0ucKjdubqspgCYwxTOacPrJ
	LYJEaw4+bty0F64On2gCFgcFeyOBlonk4kZfofLq9Y5ph4CN+Qf0YFUBCjNBlGv+BHN7bfx1/Le
	9PYXomHH5B/iWRV7ro59tK1CvkbDO9lKdTHxx+Kyv7FAK8eBvbnQpHDxrNkw==
X-Received: by 2002:a05:690e:b8d:b0:66d:2276:bea with SMTP id 956f58d0204a3-66fb5abc685mr5954562d50.35.1788781650711;
        Mon, 07 Sep 2026 04:47:30 -0700 (PDT)
X-Received: by 2002:a05:690e:b8d:b0:66d:2276:bea with SMTP id
 956f58d0204a3-66fb5abc685mr5954550d50.35.1788781650223; Mon, 07 Sep 2026
 04:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
 <20260907-arcane-sassy-fennec-afc02a@quoll> <58e186c1-d199-40ec-a165-2d3e4f36c623@kernel.org>
In-Reply-To: <58e186c1-d199-40ec-a165-2d3e4f36c623@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:17:19 +0530
X-Gm-Features: AcwNN1XXb0eVO7BU5GwO2TvIzIj99UoYsYsbFLmLlnq_kiZvskMwYXQlzc44yys
Message-ID: <CAC-tS8ANBcNatz4LO781zT_4XKwE7TkHrDaQ4N8JFr5x_vFvFw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qw24sfV6vgFlDprxtcRftgdfsgLDJjry
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ea453 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jnI5DnPC5xRnza1bqQQA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: qw24sfV6vgFlDprxtcRftgdfsgLDJjry
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX3tZiusxYHl8r
 KdBLiSux7k/JhVeSzbkJnQdyhA+imghapq+mubrEOJyBAhyLMaRVtzXix2owyAFj1ys7niXPwUC
 u3ZdEDHr9EdDEV3rIT/XADFQw05dyl8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX3NqvIwh9MDnm
 uAPc9QiRKv9HoqHZAiByJI/i3DP7kUP3CjAXs92tWa7sJhE+UWRKaFmjZ4ycRXvh1oeUbaDmceJ
 pjhiuw0Wk6hT9YpHpDKl3cPhODA+4uEAwlyVdl3Tsdtj6UEeQByxQ5vPsAlLFY9omrpVlGczxKL
 UJ0TzUEMmeSEuFXFSvam3IX3Ls+ykgsMUbNkrtyJy5voaR+GVDoOfq31JkG0vqLup/h137aq6eF
 hbaao4wDOXeisF1+AoeZ0cuH8qM+IHHEQJxK23MArcuV9DEzFsxPlahNnjyqcFdPP7JWSGGsMgt
 JpQXH83YmttKxdoodke5G56XdFuoPWwuGwGlKhiE8PMqGrT24sCs4lpc8SCIqDRaOGaf+a8BQCg
 pV5tWNn6nxBIE6imAvTXlMfPwvAoqrhmrt1xVnTM7AbPcCckRIt5/Juuk/qz5IJhfb0QUoSWQJ/
 JSvyfimeZ1n2Dxoa2VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070130

On Mon, Sep 7, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/09/2026 10:30, Krzysztof Kozlowski wrote:
> > On Thu, Sep 03, 2026 at 12:58:52PM +0530, Harendra Gautam wrote:
> >>
> >> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU=
 DAI
> >
> > Why do your commits have leading blank line? I mean, really, how is it
> > possible to create such commit?
> >
> > Additionally, way you send your work is making this unnecessarily
> > difficult for us. Look, does this work?
> >
> >       b4 diff '20260903072902.3870009-2-harendra.gautam@oss.qualcomm.co=
m'
> >
> > ? No, it does not:
> >
>
> And now I checked... and you did not even use b4 to send v3 and v4. I
> mean, really... why? All internal guides, all external presentations
> EVERYWHERE we say this is expected and even almost a must for bigger work=
.
Apologies for that. This is my first upstream series and I was not
aware of the b4 send requirement at the time. v3 and v4 were sent via
git send-email. v5 will be sent via b4 send.
-Harendra
>
> Best regards,
> Krzysztof
