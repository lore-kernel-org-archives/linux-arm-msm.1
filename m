Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795202973;
	b=aMsn4odCBymRjXK+bAMa4sgTOB13b+u4vUnUgjRa3gwJczvwveCe6lxicIFI5SVJWIoD
	 bmr5aLHSplbaSX1zmDguzsphXRw+3STjEjKSbFes/W4HhPeiLZ9hKOvbjYrUgo2iOIIDs
	 c7wW+qj2UpWxQshTZEuGPt/8HYEi0EF2dskQOz+SGeo1omKlAULwQXn29TbJOC/eKriKi
	 HOZavnikJsp5FM+hEqhuOdLFW42AoQEwoAGHK0sfegCU0ZGzlD+tm0E1FKH/47aW8dT4a
	 kzpdvh6GZAUl8339FvRE+91jwToil+IogHC1BBirvQtYBjm7f9REBn1CoUV2XzKKCxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=;
	b=DKPI6LcQKxGIPFfdGKjpWLGdjQCgu4Y+LZ32HQcahxt+1H5O5IFAimiCjPhc5X2khRem
	 OK0+vGhHuuCuU57c1atH73NOjBF+lDRC8zStWXKREnRR5Bt/8Dlh+FenC4jFvGV+QVZZ/
	 gNorc/zuQ/MKMvrafyuhKZJ34P2GeBf+QVYgGQNTjsTkhgJCFZ/lRi8L4q67mQ/AtbujM
	 HIsdAvBCPviJ2oYwE8b9oT04QmWSGVfX+fGfEfcveu3R1POAP2feuPRkREPzKJwv/oN4Z
	 4NUMmTnStpWnVqxP5d3cyM2Ox0rZSRa0/lcYJbelo0HVH7v+bd/E4vRzGKb3iRfWYcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVw4TN6K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0SI3hZV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334E960A381A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 334E960A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVw4TN6K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0SI3hZV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGFthq3830233
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=; b=AVw4TN6KzdjgA1y5
	Jt+QYf+Wcv/0PAUntradkbNVSb2Nc48KmyDqKYziSEKXlOf7W1e5CMOtGEtSAPUQ
	lLBJ4nSesSJmS/kdxh4b7qgfYv0X3C3+vO7Kou6v6kX6L2Sgc/IBJlqjjwMJ+tsJ
	PMNa5J6DhmhgV0GNRNs3KHDqqINBK2SqnXxaJEDAgWCJwelg1dqOUm87VM/bcdbG
	7wAV3AfLR1dnJzuVFklMlL90KPV5fmvA678Fa0nczcbMsq7xbRmnKk+b7JDzFECP
	oUr7cosRi/HOupuohti8cAig6DBzzDBK+t3llAtkZNjgeQLO6/8P4noYKatbav/a
	OXt7tQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwgvea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:29:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920f97bcad4so24411266d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795202969; cv=none;
        d=google.com; s=arc-20260327;
        b=cULAKk2q1XTppYOIC62hYvghqZ1DHpNXMEMJ59sAJaCq3ZWnYRvtEIFxe8oRoaeKPF
         zgo+p+hz7lc520A+TYLxkGsmUycf4bKpLTBCR4p2XYlLp94k5w8Qg394h7AajF7H7JY+
         oyijlCmPViGV9BcA6tGp6Ygmg5YuPvVTCey/S9WgfR81J3MDelQYBeok5g0OmqfIAENN
         fr/cp9+IfCjretaKwjmijGfIRFhqd0Y6fi1H/VL8s5wWFTHRNKxlzycvP0ZIQHtivrBP
         cct6zFw5KANEndvbW2J7BgO9wKfyGiibqfqP5qr7+kieH8E57P/QYPKC398V9/nAOVm0
         YnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=;
        fh=98FiqEAbQ7bwvyESdtCqM2LuhUYUK96Oeh3bbBnyjrk=;
        b=d2e9X4x4QQ9b4Wc9u4v8udA8DHI2M/1AkuZ5ZTdQ5c+rUPHBDmgpdaCOmXc+lF0zpI
         z3bqQocC4db61iryBsi0CegnAdWvYXJ37bricJE5MsN7hWxtH86u+Gu1Rv5QrOBehsrx
         eXVns4px7PFpfK9Uzn9cwnvlHlEj5QwxlFBTG9eqZNnS4TksLjLGplFbZHdjljUwC/CG
         /qAnUbGGC3wpJ1UvFVNSH6MBfnblMJUhAec8dG73NW2gNsXLAQgmEh/cc0S+XmOtj/Ei
         zijNixMtmiFZf4Y85eo4mtfDGW6217Yahdr0gBL5PVfJLPWWNyTjsScpz21bTMGcSd+4
         Ytow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795202969; x=1795807769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=;
        b=a0SI3hZV3/nt74LhHgEtr79XOSpuz2VVCLhOrFbTAIltPQaijUq4qB+jfQUsidSY9h
         WKbFR1QwSl4xPonNemOsrJklus25vsKSAKMguoaOEu4ABkBw8Zg1/JV8QZMGxusX94WY
         cKb81aEg7+AgK68tkmeYt7TrEsUdD8KzSe03ARyXuGpggTWnSy5tfIN53l3IbAMzlfo4
         IC6i/mAUBUj8KuPztRBxLTrO0wdFse0heY1hDVTBhnjUn6gABXdnz+zdHVPcnMd9Zb8C
         Hruo3+2jbbLVJFvXUIin3H8oGzDzgA0SRzZe/mruqf98zFpRuPKRzEqvWFO75oGZKPEz
         pgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202969; x=1795807769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=;
        b=I1N9+OdZ8FEsowDJhenQO+pmc3cmU/VIURzy0ZXyCC0qFQ5jQ+yoVSlBj4Q/2QWJ1n
         9m53H1rCRLO4KAxmQ6jtTJHh3IdA16O2av8chc2PHwe6iO12t63YgVtNw3qdAT1VYAlf
         MH4lkVsOqgTADpgH0Vz1PAY9HkRF/Wf95VvYdiJR10VhAlfiz1XVFNgCIkDWDXL4lUhi
         XrDzHRXc7IZghkH/dRFIgBFqnQiuCOFGsNaLXnekEQbkQ3Edch8x3bZCz/mA20Tra1Oz
         elB66WUED2pYSAENxMcoDegItcT/cEUIsIFM9CM6I4KhAf4niC+FXjXbh/MElhMsEpjR
         yhpQ==
X-Forwarded-Encrypted: i=1; AL+hErFW3xcSr/ETbYjZ6QhAjMe6GbYcjWL4hhzfW3DxwfdRoplCUqb5q7gqGhFyCGe3OGr2vCwJUYWTvbJmLgva@vger.kernel.org
X-Gm-Message-State: APuU4Z9kqWNVLqqvb0TVOLOBSs0mILbsKFTSj/bqJSXhmBskjiZLWBJD
	iov4qKrJ99VlaV0dcmzt2dwi4a0dEF6zK0XGL/EIFR4hCDFF8BqLVudqilNf7NOlNereP4tYFXR
	qWpxaz/xvdwoPgQM2jQWD0c8obtx8YxzaiuKj301UtgfZIiyRkidlQXUr/zs2nRD+GEzGYLy06g
	pXjY9XcDes/PAdTahWHk8oWeqYYoaMiejCsLc6e3PHNtk=
X-Gm-Gg: AYBFou10fA3xG8+7OkaNbCFQrzIqs3BXBZ27xogfHgxdENG8UV277XkBT+VyvSdRRbU
	/ZeTlLX9ICUSN6ezkZUOxIIUZDFZZB7eL+CN20aWYjEoO8Wiok+35D5oMbR1pFj3JgUmpo+1d56
	8vghhxqFN7+Y/Nu1MIGFDtJMR656tYSbilgkXNSpEYoT6QxOC1pZpqNR0msCV5XAPkmLaIa2tAf
	4ZKNwP4tTArT91SJopDIJ/pfrKchoEsM6jvBa7RPaa7wWUvrUSYPLGIZhVF7rsJ92M1rPGY8Hqd
X-Received: by 2002:a05:620a:2803:b0:949:6e15:e1d7 with SMTP id af79cd13be357-949ba96f2c2mr618797385a.25.1795202969124;
        Fri, 20 Nov 2026 11:29:29 -0800 (PST)
X-Received: by 2002:a05:620a:2803:b0:949:6e15:e1d7 with SMTP id
 af79cd13be357-949ba96f2c2mr618794885a.25.1795202968630; Fri, 20 Nov 2026
 11:29:28 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795196107.git.jesse.casco@gmail.com> <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
In-Reply-To: <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:29:17 +0100
X-Gm-Features: AclHuK8qGNVtFqueyJZyAXK76qn_kBHN37vsNaB9trnpwFSizFkRMZaKi2DsVAU
Message-ID: <CAFEp6-1FXhcg85YKTMAwYA5uBP5ry=WagyZjTPFHQdYOaWWDow@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: qcom: camss: x1e80100: Use the lite clocks for
 the lite CSIDs
To: Jesse Casco <jesse.casco@gmail.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qDh4ZntanQeOn-knDNYWPes8jihM5Qv4
X-Proofpoint-GUID: qDh4ZntanQeOn-knDNYWPes8jihM5Qv4
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b009f99 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=bvlobPmEph-3l50GUF4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX3KTUH7iQQaVp
 15pCa1Jzqd+uH/sCWOs5WlsOh1iBXYQG5Ly8fdP/7cvS9T2xdOOILcIl7clNVTpgd6AoUg64mQo
 Vb/hXNBadrpww/1VroeLu5W7xsBWg2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX4BlZ89rukb2Z
 wZbH4Fk0sB5admL2fEw5/5682u4zVopMgej0IQFWIqmx+hPYtQxTOIR8NRORtqXh3YfPqP85jrY
 N4//Ehtc4OtPU0BPnOMa7E2iNTLX58WyNY8obw2l9435JRdC+YxOtFG++51wNmYLKxkSvAa4ihR
 2S0N3Ljqcuf+/qf3TBZTRojO4l3oaq5xn6vR5WQTumGNuoCUj79KIVl+fuwjeHmEOh964u9zhVn
 +onRP7+HWRHThHSgLmttyeIuYmTRH8gdzzR1uNGFH5Mev2OvpXcflhu6S9RpUc0XB65zXk7Fsfr
 KVBon1fA45EMGRDk2eGiWvW+RazQMIRlOBxc04wfzOwfa499bzjjbN8Knl6HuSbQ2g2zbg6nJDW
 Inp43XnM6iX1LtSFFcvzeY6dx7udAVmvBtXlcccDp+ZjEGmYY6l13vssnnPSlTlNLnX5yoOiSIP
 08tbi252F/+krNZ0a/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

On Fri, Nov 20, 2026 at 6:40=E2=80=AFPM Jesse Casco <jesse.casco@gmail.com>=
 wrote:
>
> The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
> clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
> "vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
> then run with their own CSI-2 receiver unclocked: their registers can be
> read and they raise the reset interrupt, but they never report RX, RDI
> or buffer-done interrupts, so no frame arrives.
>
> Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
> already use.
>
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3..7d9622097 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4287,13 +4287,13 @@ static const struct camss_subdev_resources csid_r=
es_x1e80100[] =3D {
>         {
>                 .regulators =3D {},
>                 .clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -                          "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +                          "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cp=
hy_rx" },
>                 .clock_rate =3D { { 0 },
>                                 { 0 },
>                                 { 64000000, 80000000 },
>                                 { 80000000,  100000000, 200000000,
>                                   300000000, 400000000 },
> -                               { 300000000, 400000000, 480000000 },
> +                               { 266666667, 400000000, 480000000 },
>                                 { 300000000, 400000000, 480000000 }, },
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
> @@ -4308,13 +4308,13 @@ static const struct camss_subdev_resources csid_r=
es_x1e80100[] =3D {
>         {
>                 .regulators =3D {},
>                 .clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -                          "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +                          "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cp=
hy_rx" },
>                 .clock_rate =3D { { 0 },
>                                 { 0 },
>                                 { 64000000, 80000000 },
>                                 { 80000000,  100000000, 200000000,
>                                   300000000, 400000000 },
> -                               { 300000000, 400000000, 480000000 },
> +                               { 266666667, 400000000, 480000000 },
>                                 { 300000000, 400000000, 480000000 }, },
>
>                 .reg =3D { "csid_lite1" },
> --
> 2.56.1
>
