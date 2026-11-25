Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795597986;
	b=oZIjO+V69+rNzFl8hW220tI4Syb3fDuSRdwR4EkuOjJ5bdcdAw+CHFK43XGDc6hBAJfF
	 pfr2PjYrUORwmw7EvvLDoElWmxIIEmVuUs+BHj7EBk2mAawYNUSu1/AfcLDzHMUPaHXb7
	 4rxJo+awFVvvmfoZWw3myUKzCQVCjktCbHEf+j5jUlcw/bmiIeDxupy1U4oM1CkuQ8gd9
	 6Imza/V8xkSar1iJt8wDwx5nU3kafY6oJhKLUFVbBRmjYJqAnTUSSyFEHhGW8Vuapvaod
	 75q/OSHfbebTDAtqAtPhGxVKzoHKfLKOCfYuXep/eqxZPq5lcAg1gBHTRxbOhXB2u1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
	b=b0+hDbChjgxlykVoCIcm8G+6fBhvs1mpczYBqS04WFZKr5R4+d3mTszVI2v63MQz9fVC
	 vVJYtnN666N1DP/rp/asAUy0+UPo8O7L+z64blczBPkuKRXhHjKFtbb5JwfO5EVghNmM/
	 H8a5nU0uw3YiGzkSexGKkvhfLdPAsyj0m1sM3RGl8xLXxYUzDUdkKvELZrfuojneD7OvM
	 M2ioEtRnewq/ZToVv7UeFCT5qNTgLsRVMQSSBWe3tAD1mjffOcr1nZIndfUBfZlIcylt3
	 dfRmE7n7sZiMXkc9Qa0NW/LAD5sNg3DMXZrhUtfX+zr4pdWPwXjShdCWQ+0qgJeilvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6FJj4hR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpP4qcPg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F149F606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F149F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6FJj4hR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpP4qcPg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9CfH94048425
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=; b=k6FJj4hRIQKFzeM/
	fKmiZZWGWiscElpCsMLxIigg6aDi/8JLNSuz4xdgrLmz8OJd9VoOA53MgPpy+JQN
	EnOGDDydlLg0DdJK8/O7yqrRhh5qYVz+65evyV/6t9Z5p8Ai5M35Acr4cb3yxeN9
	SFmhQ0oVeW7syHITsfEvvzI34IZ/nE41xeaUWKtBqdvJe+LVR1SBrf2sE9nRe3ZC
	ijaT29iuz4leQmy1+TCV0vyb7nInLzDhxuzO5ZhFN3lBSlH7NrLwm9G75RxCT4QW
	qhrgpi1i6vAx5Ghk6z4VLyMM2T9vwHO6VHSNnMRDUqrmikiiqbDwB1Q5Mj3LX50u
	O2E2AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhr057-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:13:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso153766285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795597984; cv=none;
        d=google.com; s=arc-20260327;
        b=MuFanB7yUqJNlYAp0I08rqSkosn44I+83OF8LWcuHtdEKVUk/5t8JvZF3ySWMLv1ZO
         jWRaxmdpb1ptI7EZlW3hWVy0/cepq6uscubOmpDWSdlyatFozrv5D3FZGMJWU9zTYYHh
         fWOhl/oC7pFBnLK9SkEMsRwDcRhjbG+VOACEk6drL7vCPXK+NlkKF7aczxaZgC12q4Dv
         CGhxgnVUU/hj9TFzbodgEKogwRRLY8RQnWhndNDjTNV1BxBjWCSPau6+xwOPbPl8Kqf7
         nWpRxpFx7tAYSZ6dDtsEySzPmR+jP0WYKBDcTgy3y4OttNZnEOIcjIG8lUK0ffjfQoCZ
         8BUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        fh=agR/87RRe1w4uaaNz1Plg8POBuiAXaiuhu8mAOXuoxY=;
        b=GV+hESkn7POEkOeLiXA3ieTh5jeiFnrcwz5qCPGjISF2ZUQTZk4MtyZ9kjGMyfpNBF
         2E6EvbThH6x1FE59auLWu38icWfNQ6443anVIu2CRQPufxlu1PgDGVzFe9o/Dp6V2lhk
         mWCX5PaDvIJQcjqX5IYomN4moiW2ZWPS0rT4FCDcWBXokPwXJYeW8yJ0xn2GykrKTRwh
         Wcr60TIZi7OJfZ5X4JhHK8nwN3yFsHdHSsPV47EckDy8WNZYTRp2II+NBM0+M6ABLaUe
         I8UXdRuSiu4ITBrJD9mzlBstSK0xMdgQ/VMvoHf3zIlhmze0xoi76bYeUgLCg8jqHwje
         owiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597984; x=1796202784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        b=jpP4qcPgImboW6uKxuFCyL1nrsr7Bl/vRuXusoNQZUWPo/+6STtX0gsxHsIsOagrIr
         NXjdEqt90nvYoFcSeRu/ke3MX1HgBh1g6atAvSDHBFGX6DfQ7s+Aiu41ESdZZWI+QXc7
         S7ntQFbCFPSBqxH5wOhnYMS6Qofssa72e9106D29qPXeJbVJB67AsNXQymRpIq8/a6Yu
         NJx639ntPGvtPuPKOjeS4zcmE0T72Lg0RoN14sI3cYqmZdf1ZYVzlgrDNalX2Z5Vxv1o
         Zvha7tKmideUgjkXa7wjMA/7elA7YGy/2vLnzVQhV3BWd7uEaRFyXWAqAQx32js8M7M4
         GhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597984; x=1796202784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        b=aYyWvedpcOcLjkhPFTlnYOLaoW10i3j9bDNAFqK5ZVSFEjGfuE40aTsBVmyRDlRtJ4
         M7/o+IzR7zTFlESWP1l4yFF40rGxGIdt5yU9D50Q9YMz1pzHd+HaL8xHyoLxf+QlrWjw
         9LkDp/bB0pH2XSg9pAo4Wl9y9oJgrHjUmdLZ3+4+grNmEo/5GOPIrkxFIHqzaS6wy8Dm
         kPnHRkEBsDKbLLqo6kXNs6ocPxuDupVIlfaLieH/tCPEld29YmOg+TNj/z8CspuqxM3f
         OX9wYKIF7KngpQ+t7Ft29ER6FPqTHbcWVL/4eLd9+iSyeN4cKZ/96SLicYotpx69B6Yg
         HrPA==
X-Forwarded-Encrypted: i=1; AL+hErGJdi5DwWI0O++fWm34PCqZ+ILq/erO5s8mCTp7BJWso2AXIbMVPvdx1disPnZ6lSQieLx05UR3c4ibXh4u@vger.kernel.org
X-Gm-Message-State: APuU4Z/kPVA2GZYXSHGoxFxoW0sfUocQz6yh+IPGWaFDaJBH4ENXVwxw
	cFibsbp9GBJucuX/Tj6lS56Gx08fpPlGkjc0sHgHcrpm/EqzJJSfiVxppDzlXU4aOdSVgKO3VkZ
	7WhzGinUsUxZV6jJz3rQ/l5/NY0ASHWHoG6053NprZdhp4BLnsYTclC+udJ/h1RzFIfH1jW4Ifg
	/VrxWbINgBU1Oj6vvgw5CzvpWz8lzP6mpsqnyL8sYA7lI=
X-Gm-Gg: AZFdTZev/0FmZj8T+sZznh6Hg8igkvAwIXUeQcHrTpULa8gFpBTHSmwtLourApLVUP1
	W0ti3qd9ak5Z1HFiVdOYLdhcUNfvro6Wy3SVQOIc+LuJSf/N4N87a4RF6VMVzPrODZQCbQYbkTm
	FtClc/tfvhwFjg97p58rahrNMtA0C8svInW6Pnd9uQ6RxXOXWx3+8RKX1tkoeETn2L7SOPGnCsj
	DEqB5x9c9THtk4yzo5ueROx+SAStoT8jw8doA7MAQJ75YlXssqmjo3FWT7i2V1hev7up6n8fJk=
X-Received: by 2002:a05:620a:2709:b0:945:f0ca:436a with SMTP id af79cd13be357-949ba826ddfmr2815621885a.2.1795597984027;
        Wed, 25 Nov 2026 01:13:04 -0800 (PST)
X-Received: by 2002:a05:620a:2709:b0:945:f0ca:436a with SMTP id
 af79cd13be357-949ba826ddfmr2815619185a.2.1795597983550; Wed, 25 Nov 2026
 01:13:03 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com> <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
In-Reply-To: <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:12:52 +0100
X-Gm-Features: Aa3M54o5HS1ZSN7gcyaucoZUOYIdk3t5UM_zccpRk9u6cy4s65EXPVC2xdjtFqw
Message-ID: <CAFEp6-0XqOVFjQU0-P8oiDGG6amW5Akj7TVBf=P_S7Hz80EYaw@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06a6a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=6AgpfqnHUIBFi_xuLsEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SeQG3lgkCXcyG-4_UKz6G1rQNofJWkaR
X-Proofpoint-ORIG-GUID: SeQG3lgkCXcyG-4_UKz6G1rQNofJWkaR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX87cO1xqSW2ti
 xhoSnU/dWFzcbUoyTeAI7j4MqINieVxpw7WqW9am529SwvokcpdKNOGS0PYpvVz90g2Ao05CyyZ
 iurnC9sovgefhuEvaOp6nPicIhI6KLk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXzrbsf9YECdPB
 QZsFZBaz11ATad6YJSSz6ziJ2T9UK7DBls7sK0F+jJstzv8ZlYZM3kBHRRBqXZFgfa/vWjW0SZl
 G0G4TWnkH6SgCXOlTjC91/qDgtJTfNgKoreLWV06c1dfAvbdje3fseCNo43KAdsO2xEUxV072iR
 NJG/X9rZmbAMFrs2LLEaSx8Dk2XpQQbhkWOzfXN+DYTzsELfB7Z8nTn8arevL+zFUVlNIlj08Ld
 YFKbk2mCLrzdt3jDCCdRYY5AFOdlIokqr3GZbZzyIKFy1tJDiKiD4XnmEV2W3agEo3F78oMpd0q
 5ckQHLdWC7nKAaJhBjvq7OWr18Qo3uqu+l56rpxvan07y31ge07x0eF3QPK5xlAt/pYS5JlHxnb
 GsL8iEhgnsGFGCqm9JID7ZZZcdbAdMHLiv8A3ji7HWDqJlVgUdu86o28MioXtkkxHZO/5AwVB9R
 i8uykkcnz5/z3sqpTPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On Wed, Nov 25, 2026 at 10:01=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 11/23/2026 7:16 PM, Loic Poulain wrote:
> > The CAMSS CSID latches the ARM architected counter on every start of
> > frame. This series exposes that time to userspace, both through the
> > V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> >
> > Until now both were taken when the interrupt was handled, or worse, whe=
n
> > the frame had finished being written out to memory, which is about a
> > frame period late. The hardware value is free of interrupt latency and
> > is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> > with other timestamped data such as IMU samples.
>
>
> Directly comparable with CLOCK_MONOTONIC, does this means
> that csid timestamp is in monotonic time domain?
> In camss video the flag V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC so either we ne=
ed
> to provide timestamp in that domain or convert in the driver.

Both the CSI timestamp counter and the kernel timekeeping code are
driven by the architectural timer, so they share the same timer
source. So, if we know the difference between the current
architectural timer tick value (snap.cycles) and the captured SOF
timer tick value, we can derive the SOF timestamp by applying the same
delta to the current CLOCK_MONOTONIC time value.

>
> ~Gjorgji
>
> >
> > Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> > having the core take it. Patch 2 passes the SOF time down to the common
> > CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> > Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> > uses the same time to stamp the captured buffers.
> >
> > Patches 4 and 5 are picked from the timestamp support Bryan shared
> > earlier, with patch 5 adapted to use the conversion helper added in
> > patch 2 rather than its own.
> >
> > Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> > Bryan O'Donoghue (2):
> >       media: camss: Define timestamp registers for csid-gen2
> >       media: camss: csid-gen2: Report the hardware SOF timestamp
> >
> > Loic Poulain (4):
> >       media: v4l2-event: Allow drivers to provide the event timestamp
> >       media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
> >       media: qcom: camss: csid-340: Report the hardware SOF timestamp
> >       media: qcom: camss: Timestamp buffers at start of frame
> >
> >  drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++--
> >  drivers/media/platform/qcom/camss/camss-csid-680.c |  2 +-
> >  .../media/platform/qcom/camss/camss-csid-gen2.c    | 32 ++++++++-
> >  .../media/platform/qcom/camss/camss-csid-gen3.c    |  2 +-
> >  drivers/media/platform/qcom/camss/camss-csid.c     | 81 ++++++++++++++=
+++++++-
> >  drivers/media/platform/qcom/camss/camss-csid.h     | 25 ++++++-
> >  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
> >  drivers/media/platform/qcom/camss/camss-vfe.c      |  8 ++-
> >  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
> >  drivers/media/v4l2-core/v4l2-event.c               | 20 +++++-
> >  include/media/v4l2-event.h                         |  9 ++-
> >  11 files changed, 205 insertions(+), 19 deletions(-)
> > ---
> > base-commit: 2ad58ca589da80990b7afbcff018777851577f89
> > change-id: 20261123-camss-hw-ts-e0297adb69d9
> >
> > Best regards,
>
