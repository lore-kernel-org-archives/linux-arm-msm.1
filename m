Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181012;
	b=CPi1HQ+676vfZ2Q4WWPG4MxrRcOK+Zo+EYMRUuk6Wucpw4zxPBPTQr4BuqSsXsVb/U+f
	 20YXYgJkvZ//GgSieGJDL8XPaEamqRXQdgMZAYFWrxDpDzcZVr0xZhCFFcmUyFMTQLIFT
	 hMzbGa20k3ghYpIRiDjtBcEl+yEtf8Fu0FRBrtBCKT9Xi/V8ld8s9wE/phDWbhzgy3mui
	 spEYAZnY7nrzXuYpLtXn0Q6TjWPzoxdV7XGV0DU3T6FH3V+GFYbm8WTHHIx7T2b0S9u4r
	 sv/FaP4SvxbutJEvTDegUWbHRxB6pWIVN5hky9Yzmj+pYjbEcxZubLYXNCPF1/iDgpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0oIfJOxjR4aVKlueapz0BQz+9s7InqH1f9hF6TH1K0M=;
	b=qI8Xxz5RFa4o+6LwHY49gM3/SpuUUIk5a7YfIVUpy2SYcDeYWX2K1nSea7iEmDOrAAoo
	 r1VPy9W/i7qcn7nGNqvt2qWcbhXPEqrpP2QrDo8EM5NbRrZwmfwaY9f/dc1tv0TSBuxfO
	 mTYrCO1G8S57OQuP74xJubeVYg4TFgWIV4sOSMa/AcwY3pFu66Lh4OiL7phqETwSEkzN8
	 fThkMCXH0ENz/IE3tWk9FLeWemDxb/1XdruPrhoGmVq7Rrsteuz8H+Zyn3GXbvYwyHGlM
	 tpEfYJjOdZRnhaNVOzsn1io8+P/a+/au+HNSGXWsZ6u/6x8B2jVDhDXzmrVkXuqBT5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nuT/AJ6v";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnqQjmhk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC11A606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC11A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuT/AJ6v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnqQjmhk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K74v1667693
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oIfJOxjR4aVKlueapz0BQz+9s7InqH1f9hF6TH1K0M=; b=nuT/AJ6vg4EDrAwj
	7gHn255zdRfOwT8CVDhc0MyCFjCMjcU5hDl2IMVi8wgBUhZjwpMPSLxo87XeAQ9D
	K4ek+BwZOjSeXfCIUwJzHrtZr6oIqaeDP733uGF6gNSpbtZksZ9oaZfnqkKo7RVE
	NXT7c8pXncphNUHkR/uWt4BL1+RA78JReCFlMw2oFn8keSWBseHhhazdALp6iKwz
	RngzNaoI3IrbtRLGLCexJ++N0QBbEMgl09g6za/3l26hCK2g67z2aqOYLfHpMBf0
	gdbc8OmAuzDIdWHhjviNGXQ8f2roaMraHyoTmljMxhV1BP6GESaJ5CDwhkD3ov6S
	BpGNdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12ptybp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:50:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so1323621eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181009; x=1793785809; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0oIfJOxjR4aVKlueapz0BQz+9s7InqH1f9hF6TH1K0M=;
        b=JnqQjmhkWdk2XTtwJirMu42PS6YYn0Wva6vcuGp5wLBC5z0OWVdaRegzdRaZaPkR1K
         CGHcvA5xYHMs0EfztISELh3tjvwyQBlsmvDtBp3abM32uaUqcx0B32oBOJyYTpSKKTrP
         sw2xQpAi0a17ZnDHk4r67IG13gHQDWu2emP4Rrnc2jxf3stEs87IsOt0MfhZhSUsLjNs
         3mgc5cs93eL179skJDU9mQT6P5RXiD/N6ufQEUDbKOS/i1E4z9uTAtxHFwgo8fqQdP2l
         ZfedmIqSClnmFlrJmt/CZXoQiBXrOXhBbs3e260wKLfAcE8Uj923YYIonUQ1SIP4m5iO
         s5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181009; x=1793785809;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oIfJOxjR4aVKlueapz0BQz+9s7InqH1f9hF6TH1K0M=;
        b=KulbQ9v06ZxhU7/lkM91n9pXiUoY7e9eauwKSvUFMW/f09mHiqaAWP3BSjttGKjsJT
         Wi5xQdBYKcaSPQo5chcMLuWasLUmBk1J2+EvGDZLKSUjiPolkowlZ/qbiol8kSpiIQNc
         vKrJcIcXfuu9K5gDMnJ+woj5JJZ9S7oBtBUdnK/XSl0lprCaN/Cvd+UTsWBIWQX8plIb
         G8qOBW+Q7MNmqFxJqaHkosrjJzpI2Tzox1zpwfsSSA/HhkcHPthjLKpHivWihTXXy6Y/
         FFuZAZcWgAElE1x8c698AHziuayoq/wtmDrNlMuSdapLvGqKJgd//RQW7c6/9sIDPXlK
         dETQ==
X-Forwarded-Encrypted: i=1; AKwUvByGr/YreWkaJXzhRZd18e2Z+nDw1b33AXojmWaEmFSXLG5JkLhwvalCJ5FhSubYbKHsBIRG9c65KdHuWgg/@vger.kernel.org
X-Gm-Message-State: AFq9FYImGxSZfqjS7OWMJ3Ds7eYyBihGLPQ9ROijzf03pNVwp0QLb+ss
	6OLWFfsOlcAoALVRjr9tSMsQMnhzVUsWYxJp3I0MP6nsW0L8hzRtFoItbzj4N8zY4kNv6tZ8MyX
	77cKi5llbF/lqXrfDvm8OVTTjCsHOIK+QAa0P0QLu3AUXwnBDr5qI17mK5XrnscJJ1ioi
X-Gm-Gg: AYBFou0QQ9Ulpu9Hk1zPbXlgV/KwsLerNqi0RyfDUgWcWBeFXUJEGvNvuaG5FmlxGha
	jk5nkUPDu0DKruIePuLjFjUVgM3H2qFiaVkVuBZj0FzGuZ/eR8yShmSuSalOC7WImDTFz7B/z/n
	Q9abgF6ipzquN0JI+cownZm4kzDLwOtZXw2l9O8Rh6LyZ/2slNMnU3dfYnfTNsq6Q3i7Gxda/CZ
	qeop/lu/F6MISfsY6eCIUd60aSfn8YQNrvarV1ij6WpklTaAjLpW4KwtGE5qYzx1teWvmoQRbYI
	q3WTBrSmSu2Rw0zQgVeQZn8nGBCYpFcauk4KXWWHgq4q0Pc4mJabVZqsUN/ZEuHAh5y1MTRWJE2
	R8GHIwsOQKO+sB/qGeZDqXq+cDsixFOGWzC61TvgOLuho71S3kMr2xBKQWKqZbMjGV2LTN+ERTr
	LXvaObSwU8UOlbRAEdPMsprqbDqoeHy6b2GAgkfQ4o8UslVEkqdyM9jm3CXk60zlYlSdPHXd4=
X-Received: by 2002:a05:693c:880d:10b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a20390c1fmr2689409eec.9.1793181008700;
        Wed, 28 Oct 2026 02:50:08 -0700 (PDT)
X-Received: by 2002:a05:693c:880d:10b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a20390c1fmr2689372eec.9.1793181008098;
        Wed, 28 Oct 2026 02:50:08 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm6200731eec.20.2026.10.28.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:50:07 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register
 using readq()
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <179189473286.2132802.7434637844183959510.b4-reply@b4>
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
 <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
 <179189473286.2132802.7434637844183959510.b4-reply@b4>
Date: Wed, 28 Oct 2026 15:20:02 +0530
Message-Id: <179318100276.2544529.9468208278273297735.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793181005; l=2659;
 i=sivansh.gupta@oss.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=AhwuCOFFa0XarszG4FWlhHz+3Hx/qE+SKyAfeGzSlUQ=;
 b=lzvaO9RLAriU15rF+bFkcF26jXirwmG/OExUo0H1/ZCxT0zGt7DCdyE28XvVhuEdaEAP3s/m+
 wxGx20veYnABO/nGkK8+3GM/3KrwLvWHRvGrX/CWPZ5EFUphMOvau4t
X-Developer-Key: i=sivansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Proofpoint-ORIG-GUID: 5Mr4-9a_jxxVEDqBdZCBMA2nU-jscv7V
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1c552 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AviaC4fXV1LfX5AF1TUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX729XTfPG8/Iv
 ikrj0ptw0HGPcFu1tHfkpaTvkre6rj3FNy9bYUm76UyKohEsBLo+3C4SFTTnrVa4wxEU99a33SZ
 d0LiSo9tcxCVtOjOKkpasf9+MJDIJNUGcgx3RA8OtR0X09Pbpo7hWxd7cvMPJwWSmmN12BRGF4Z
 fBGt0TiJk7hhwRRL+WQ86ge4kO6/dYWCC7bQsMW7dh0wekFFsm0kJP6UC7iMVJ102KBm5luxDyR
 MiTek7NKb9L9+rSCPN7RXqYBiG23ZuRmUNiNY2LrzGP+jkq7jbcjL8a4J4G4PScBBYoOZYTFzxT
 tdp05YgbHTHpGhVKoNjiOjx1ZtAD125RIyqUU8YGL/wHvS8Degk6gFsOneI0cIKkqAevb01oPr8
 1v/0H2dCiKig5KSxw295sqOAqyTIxWnMJY+w5T8QavB7CeniKt0p2EOPZdNHKN5e5lVlryrG5Te
 c7UFjlm7k7M8Ow8qfzg==
X-Proofpoint-GUID: 5Mr4-9a_jxxVEDqBdZCBMA2nU-jscv7V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfXxLDT1HHbYPBk
 FpvyjZ4AzNsX+8AT/oYxA/kMgnTUmBlwvIAGPRWi09bcQeruNjv4+oHUaSz6i6CxGSTEJ+XU24D
 jXrHL3hL0kC+0fOPVxEDH5aPZG7oZH8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

On 2026-10-13 18:02 +0530, Sivansh Gupta wrote:
> On 2026-09-30 11:55 +0200, Konrad Dybcio wrote:
> > On 9/28/26 7:29 AM, Sivansh Gupta wrote:
> > > Mailbox hardware registers are 64 bit wide, but the interrupt handler
> > > currently reads only 32 bits with readl() at offset 0x4 (upper 32
> > > bits). This returns an incorrect value, while reading using readq()
> > > returns the expected value.
> > > 
> > > Use readq() to access the 64 bit register and pass the expected value
> > > to the mailbox client.
> > > 
> > > Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> > > Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> > > ---
> > > v3:
> > > - Removed references to an out of tree driver to focus on the incorrect
> > >   value returned by readl()
> > >   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
> > > 
> > > v2:
> > > - Expanded the commit message to explain why this change is required.
> > > 
> > >  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> > > index 862e45e8fbd5..0b584d9aad6c 100644
> > > --- a/drivers/mailbox/qcom-cpucp-mbox.c
> > > +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> > > @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
> > >  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> > >  
> > >  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
> > > -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> > 
> > This still retains the writel() later on
> 
> This is intentional, currently the existing mbox client(s) assume 32 bits
> writes instead of 64 bits, changing to 64 bits here would require all
> mbox clients to be updated to send 64 bits.
> Currently there is only 1 upstream client (arm_scmi).
> 
> > > +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
> > 
> > This will alter the indices of the mailbox channels, but it's ""fine""
> > because it's always zero for the existing platforms..
> > 
> > Konrad
> 
> I am unsure what you mean here. The channel registers are spaced 8 bytes
> apart. In the old code, we used to read each channel's upper 32 bits
> (channel base + 4 bytes), in the new code we will be reading the entire
> 8 bytes.
> If this is not what you meant, please let me know!
> 
> Thanks,
> Sivansh

Hey Konrad, you might have missed my message, so just sending a gentle
reminder!

Sivansh

