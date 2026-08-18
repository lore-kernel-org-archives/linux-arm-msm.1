Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070F2D77F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047235; cv=none; b=P0ndIwZih4KHnJOb9Hxncf65KPoLRfeYfFCMN01oj9XfKpOKeH6ghXW7sg4vHLYW/CMkyM7S338+Cc2Gd1FMaaGw3C2pLVozmF4RAEjTAGg730kmYCRWjXhuUBJE7G4QCnaVJWM7tGd0Sz5xJWkZT5T2MsAk5jtQrO45RO2ohn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047235; c=relaxed/simple;
	bh=DGHCyM6EgNROxkjHqWkuJzh+ya7ky284zeTkekMfqtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tm/ebbTX+nZ0kv2UKGUXx2vtgZVBaXn0jqsv2m2n04uYQ5rnOjcpq7bcsLHiC88DWhW5Mf9KJOtR0ULL0vD0gzPew1vEq425TDe2j6LtS2VXtNO2C7VuFin2jDWvvLc/DihwLPhk5Z6BkdaGmB75s6SffrWeymY9kTWu0OhZvhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5HyMVuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZn0Tadn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5HyMVuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZn0Tadn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BKQ11061753
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CmC2OIm3QkWdoYT4PvRcnLDW1LDruaDVLoidQBfzW4g=; b=Z5HyMVuMfyYI072v
	J4PgVkyIprWfDUtRP6fncs4Ay0NsPNgezNEM+DNK1cO320NjgDzGXinyYdAVMRIW
	MpraNxa6B+ouCuhSwR52oyU1jx3jR/mKz3u5UAaKmqupNv7RRMYgM8tGXa2N10mI
	YaORhRLaoTAMZ9Lr7iKNNFsqY3g2JkK1sRvkoegD4+gbEIzxaMt2gxDD5PMVmnkz
	PXHSd5K96grNzqTCsViWqoz8uOuJpBQqZ3MSuob6EFLJdwoaX0zAR7qSM3OhSFvB
	1vcivmo9zNvxzPZqYs0gVIPIaLGJTHgQD7qJluxjj/7E/w//GZkw+H45AfUmm4oZ
	1/mezA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp1eqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:00:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso275413485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047232; x=1787652032; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmC2OIm3QkWdoYT4PvRcnLDW1LDruaDVLoidQBfzW4g=;
        b=dZn0TadnsChK3SXbCiLgzHlgYDLlyoU98j4vUfiSjXkQKHWz/isr0lX/8eawo6RLft
         EMOD1Eik7Twk6jfZ7qH6zFYKXpM4Pw4suZ26dr1yKGjqpXHYbdeoxw0sxQwfDngABxfl
         u4i6QsLd1swLBOa/d7DgOU5jneE3lJg12NhHfPuupMk3XHxCR3CvUHCJlWlpLehTCDTl
         PtABI1QDf0B43BmtD00KTcitTulkX3dPB3IiPqiDjXfT0jaLXMvGxvy3195rjQ5j6YiC
         osUcjj663H+JldHFil/V9g4xK/uCXEKALUDi9mnb89W0KWV5TRgO80vvLY+UgogxoWzh
         QHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047232; x=1787652032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CmC2OIm3QkWdoYT4PvRcnLDW1LDruaDVLoidQBfzW4g=;
        b=PFtCGF/nPtLlC/IoxcHTTLddxAZSI3Vkox6WnYtcTaX+fnagKULcuFTObwWPe03ky0
         leO67ZXgbWpulNwyOY5pD6Ha8G56F0JkkEfiVbOiyL2+fnTINYeb77zke9FbxQxyx73j
         vbKLZuR86wHMWRhUWjueqGRV76IssC7N9rdfJ665zTBVURg4h4VeIFdmWBB+FUhG60wF
         GCuw4d9bBvWgYG+IU85mARhiWcCTyZXUpPoYfYvGcN5vn9lApSOSyecD6+W7XQdEIvAi
         2ur14ZuAFE6xOCCTLJLxFk6k1ZEZtksDlKGF0YH32YTnEwFUiGRQnCE43mTwkVHK3uQw
         aUcA==
X-Forwarded-Encrypted: i=1; AHgh+Rrq4Cn9qETcdvQF3Sl+0iQTLqWepBiAvSlymJ/spRRqxlj9Vg3elY0MqXexAVc8lHBppVbjAYZfr/kxub4x@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfwMhoQdbvEDryl32L7o5AklYQrC7A6qX7eksnA/A+j/Q2ema
	skzGn/pUHX1CfskNZpGqwUfTQnQ7+R79zF19n+I/5aouhCVHqPGxCOzwQmJn5WF+dgaxpfp3p3s
	KRwlgt5YUn8KXJt+7CPO2KzdQ9I5qPlqepinJ+RDFqccLHGzBRO6MIL+rEm6B5tUXd/Tg
X-Gm-Gg: AR+sD12Vi/htAayqfsgV4mb7vE2cpv9Ztvt9LPM114YzsNlKO2UiwZaGa39oi6nOMKk
	IdYhNSIrkHRv9vvwJg28Sivh1Pyl8hrQeUsRKrSAcQmBjD6gN/rYjcFQELQzJNR5Lb88PM0MI/n
	P1dk3doG+6GWnYY8gE5JOH4xztG6RZfp9OyB57ihvDPoQjAFi46G9BastZ+wdzRTn9xxyzJO4IG
	gWl+K34NzwUQNlZjNSsDgbtf5n9uee235axEw3reG2Ll8esB+FAixlQ181EwkPXBwJNP2I2nSdL
	YzS5Tm6bQbkifQlP7B+E/uT27svCUtNtvRSlq3UKbpCsi6VDyyV0MI48Q5hWXPof5zO44TmSaC/
	JbXyzaSLyxqLz3Cg=
X-Received: by 2002:a05:620a:2683:b0:915:673a:617b with SMTP id af79cd13be357-936d22cf71cmr3145479185a.24.1787047230913;
        Tue, 18 Aug 2026 03:00:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2683:b0:915:673a:617b with SMTP id af79cd13be357-936d22cf71cmr3145468885a.24.1787047230252;
        Tue, 18 Aug 2026 03:00:30 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499877d5548sm269379435e9.1.2026.08.18.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:00:29 -0700 (PDT)
Date: Tue, 18 Aug 2026 13:00:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power
 domains for Eliza
Message-ID: <pzfjctbfuqghiluu6w6wteihsx55xudursi2ifsqylqgc2jgux@b2rgwlctk2l5>
References: <20260810-pmdomain-add-missing-mxc-mmcx-on-eliza-v1-1-5e10fad1e456@oss.qualcomm.com>
 <CAPx+jO80r_QF-hqGuRV4BnHyKoub3+j3EPbnZ81ejz+wKBBQ+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO80r_QF-hqGuRV4BnHyKoub3+j3EPbnZ81ejz+wKBBQ+Q@mail.gmail.com>
X-Proofpoint-ORIG-GUID: d8l7vM9WiaFse9gFMz3j6NTSo5a1Vj73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX0/CxcLJRJmvr
 X1M+IGABaIOE/6M+6N9rJtyO6zAirh+G3R4SrT1ZDkP09ZjR+CoBmWMUhfh/+t7vPPMjM/4tGS2
 q3V6Ib7i7SX0fVkhB+bg1W+SCBe2LE3amHa7N3H7guXAxe8/VClkVwMyljOAhe8YikEVh6ZZFeC
 81ER0Ev7VAJDUzTSvL0jL+UvWG/ts8LFeHU4bLtNRdaOYCKZeDo3Kkka2eEAOFsiBFdtOjgzLGk
 APujaB9EuJTB7aH6+dnb6SMJWgjNx9QLXsZCUUlqtdI59gu6wjXz7AgbR53IU/owKo/WJUATut5
 xvstX8My90opUTn/6gnJv+zW9EYHwRWbQ0FkmclNfWOkyEyS9zTqSdSBcIabaTkCAkBgcX5g/CV
 b2iCJHubm6iHBmNkWQZ/gU8BQJy+BSsA4h+apj7cQ7CSw/omJ5U/dpKukEDX9T2ILTCi7ZCjAvp
 L3qNQVx+8PfYh0zyXEQ==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a842d41 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=V1eyK7yU7IpJqu2TsEMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfXxF7NY0bPtL5w
 KI8KguhpTBPuJEvtCTRXUfrled4CXD+uvdTT314wTDPtzLSQ6P8FueamYvmscn0cD/qxQJJUgRK
 S7caep0jXdySLAeF7w4JNY3eH8hqZ0c=
X-Proofpoint-GUID: d8l7vM9WiaFse9gFMz3j6NTSo5a1Vj73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180073

On 26-08-11 12:30:42, Ulf Hansson wrote:
> On Mon, Aug 10, 2026 at 1:10 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > MXC and MMCX were initially omitted as they were believed to have no
> > consumers, and they were not present downstream either.
> >
> > The Iris video codec requires these power domains, so add MXC and MMCX
> > along with the MXC_AO and MMCX_AO.
> >
> > Fixes: f387ecdd492f ("pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Applied for fixes and by adding a stable tag, thanks!

So I think this one needs to be reverted after all.

The MXC and MMCX are indeed available in the cmd-db, which has been the
main source of information for this until recently. Also, Iris video
codec bring-up engineer thought they were necessary. Meanwhile, after
discussing off-list, it has been concluded that these are indeed not
wired up in HW, therefore, even if they show up in cmd-db, they are not
actually there. So I'll send a revert for this soon.

Sorry about the whole mess.
