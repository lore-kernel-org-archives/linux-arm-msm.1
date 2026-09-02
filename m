Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E459368D78
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 05:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325215; cv=none; b=FeAvduk9WnEXw4u/NttkuVnR99dlRunegCG5EfqmXjfMGTEdC/vAAOnO7T7kivL8Y6qyHW58+RqVvl3f5PoIsYWXZp3jXeoIr5lydnqR28+MiTz30WaHe9bYnpJHRfgz4JLaAw8jMDIgRFQ13kIxXfmmzIjlx1hzsLA06XFrH0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325215; c=relaxed/simple;
	bh=ix8Jt+hM1Cyp6m5izLCaQAzM7nA2N4MeyGqMXpmFjng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Au3E5+b/nNRGPVaz7PNPGGVoAAiFN51E9qEUhlxSn23RTK2nwFYtDkvijAdhXzyDPx8p9WzLhXopHgVD8eHI9i3JhUSDbn48oxuEXFHa7HAV2n2zcfSkaEsUNg5oiAyIxpnKv1Yh59IHbbHR9h1T7ogOCRtVktAYcc1dGMh1NKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFf5Fk2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvnmOHXZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFf5Fk2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvnmOHXZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTLgg3484839
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 05:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=; b=GFf5Fk2rMsztuFcz
	rFmQPBTUWjFkRyhhCNt//wTiHOe8no+ew81UVhl6HD5kiqdRZLffl9GwRWbKN+OG
	/vTbnP5izCxS6drAj+WagZ6tFSD4s2AeF+qu0SGmXIGZjMaUYqSeMO/GpbOYhLP/
	Op4SJHWfjrbpGQpaBkHZ587N01DNiaZEEsDWuFrrm9aVxy4pRUZ5Vi4eLXVO7UTU
	I5SnVcDRPIV/vDVMJP6o+iibdEH/dhoBKLhEh56YfpXwlQrcerIuA39uuRLyzWw6
	gikWwFGy/JI0FycFr4N5/namFdwUVYlom2KQsKY8Ly9ytf0BP166LvtTy262jOjI
	vp6YCA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435swtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 05:00:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so923190a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325211; x=1788930011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=;
        b=EvnmOHXZMdDAZv71KD4JeV/KrBY04nH7U2jUUuQfn9F/r3ED7fpFelGHHuAh0kkVAo
         IOY6psXrNjmFQOtHhTNPqjEJZg0f7q6EcnjCw6P2VsBHD7fbuGy/VD10oRlXZRs6w9qe
         jK4/LjqTsmpIv+7vjmGrHL9jOKoWSMo1qW5u/lmLfWQkvid6xmo8xR2swkVV7epg7vta
         n0D3u2D2oTVhS3/7DqxducrO3WYJU8UODSqaPVIefFzOLaRpz6BsW6aNmChE8vc2ouCX
         DBguaYgP6rpD+pJvmEGohHl3RdqK24mFRT6kZlpkp4Y5631j6sbQaPkd4RqZBTZa4aF0
         OjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325211; x=1788930011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=;
        b=lTH1xDreKbDfwDNddsqdBNpU41+kO+IU3TrQY+TI9NFnuyP1JU2MTa3bszi3EsDf1b
         rGI8tt/DmS98rcRrX2SnU7Hy6gCeq9fzS1Zda2wl+2piW/XKUgyV3QCC8LHThUhUCZU0
         T9QFNNTQtdRZZHkRZgAds7EiY2mlAZnDUKGbX255mp+e/j22bEchLN142uZPjmyBvlCJ
         2+zZYvdMGZFEOC2OH4RgvbDR9iIliI09Lga6MJ4c658q6jOgAPbY+fa1g6T1qJiKgUjy
         enwC9iU/g2n31DEbOTMpCh8ilr2OZR03wUoijU/D16UHW1+ediUGRj1HDypWx82ci9Gt
         3Zew==
X-Forwarded-Encrypted: i=1; AKwUvBwi8oxZgv0LWlsmk2wTl6Kp3zmbYb63Ayt84jx7OdsmlBDmFxuZm4AQejbjTMd3/3MLOWcDAmbcGGMkqkQZ@vger.kernel.org
X-Gm-Message-State: AFuF++nZzNGycYa8hdv7Kz4RX3ZChppechmqfBUn4jVB2eB7nGfjN5p4
	/bZvrQZXOEpEiw0SiDTMu8Tb/eKwQkAxp316MF2PFSFjfcX/srA+QyXagovCwDTxkIcDbyjfFEo
	kjCPBTFZWDHpP26ZUUFfuCczRBssfY6mNHd7FYyR6DZvgEryU4yo1Iyvh/tUku0B2OMMN
X-Gm-Gg: AYBFou1IoMHOpMAO4BczntnPCeRBtVyiSdBO0JeNcDzBVC+1a2edP1Wsj5Im79OzWyK
	ZhP/r1Mj82DcXp+O9+WmNMHp6uzt3dFbjFNHxORk7ZQRO+yvOOnLgawFgQIqI+j3KsZDigUdEqV
	7VFTZVp05EIg1S1GucV831LOVJHjNMCfne+vz2vP8cjPRdhK5NMH0jAns9RyyUnS6l3X51Y0m59
	h29ta3biaLiqare5l3LspSf/6r6M05juUHysV52MyItonmskOi3DDYVZS+ySq51CecL/mumiQNJ
	lA9JUI5iQvBj6mVOwB9+WN3f/OqmQUzsf17IJP8rpFqX67iQ6kwUyE//iGEOjEahMUtr27Vbwg5
	Sz+cga+H/vPQHE2TQqiYSy/ZB+kNSHUA+
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr3407260a91.11.1788325210749;
        Tue, 01 Sep 2026 22:00:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr3407173a91.11.1788325210150;
        Tue, 01 Sep 2026 22:00:10 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1a82sm2988817eec.10.2026.09.01.22.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:00:09 -0700 (PDT)
Message-ID: <50c5aa2c-32a8-42be-9947-f18994071863@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:30:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] bus: mhi: host: Add support for Bandwidth scale
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-4-6dea79786b37@oss.qualcomm.com>
 <tm33xb3nrq7v6ezoewvn34rteg47pmow27kda5mdmoufsckw7t@tzssd2mqm5zt>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <tm33xb3nrq7v6ezoewvn34rteg47pmow27kda5mdmoufsckw7t@tzssd2mqm5zt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX5EbD4zqFX0D8
 cIHKrYPa42tQ/8ZCDv0eBshI7g0rr9jwIPX/TPw5pBBM7ZWPofujbSlvmH3mu+PQFziyceQ9vJ4
 SkGHeh/prVUoyCQR32khusCQ9FYp8ELXpeUH2KhqOgsYC1anEfQXYdOwRyrJIeULHO1zRBkEoIA
 J0f/3GOZWQYS04admhaAfq0IETuQrnp23v4eazUU/QktiP9u4za5whmXpE6wHGYZtz9MRAFvvKm
 SZm66DJM21m9+v1WeLYWWAKkF7hTvdeljnaZ+zIqwJ6nhO0gRi5mLuajyPPyF+cwONvNQy5lV3N
 hjMGnum5u1JWJHl5GQlaW9ek7lMEu9OM76WsMcxJv3zJ3qT4QFNksuEBtUBjH7VMpc90qoJqwpl
 lpGPSIk7BTuamTBGsC919MAthCeR+Pxe2C3mo/SeckrVlUsxY+yogD+ngHSRVF/1ib6PI02+3fg
 MXKC2dsnoxpS0lcnVAg==
X-Proofpoint-GUID: pli2gzwVt5IGWLSN9JxeiyfX-nFFggpW
X-Proofpoint-ORIG-GUID: pli2gzwVt5IGWLSN9JxeiyfX-nFFggpW
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97ad5b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=H7oXqyE-OcRDxyOYSJ4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX8JZNZxqKJJoj
 3cMrYrCgs+r/eRdoW+5kn/J9lN3L/hzG3B8+yCAYmEWSaRmSyHwmiMfqW60BZ1Wmeo5FYsUkJfZ
 6QmW+XcxngYuNHy3gg5QrqMQ5nvZMZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020042



On 9/1/2026 1:36 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 19, 2026 at 06:55:55PM +0530, Krishna Chaitanya Chundru wrote:
>> As per MHI spec v1.2, sec 14, MHI supports bandwidth scaling to reduce
>> power consumption. MHI bandwidth scaling is advertised by devices that
>> contain the bandwidth scaling capability registers. If enabled, the device
>> aggregates bandwidth requirements and sends them to the host through
>> dedicated mhi event ring. After the host performs the bandwidth switch,
>> it sends an acknowledgment by ringing a doorbell.
>>
>> if the host supports bandwidth scaling events, then it must set
>> BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
>> doorbell that will be used by the host to communicate the bandwidth
>> scaling status and BW_CFG.ER_INDEX to the index for the event ring
>> to which the device should send bandwidth scaling request in the
>> bandwidth scaling capability register.
>>
>> As part of mmio init check if the bw scale capability is present or not,
>> if present advertise host supports bw scale by setting all the required
>> fields.
>>
>> MHI layer will only forward the bw scaling request to the controller
>> driver since MHI doesn't have any idea about transport layer used by
>> the controller, it is responsibility of the controller driver to do actual
>> bw scaling and then pass status to the MHI. MHI will response back to the
>> device based up on the status of the bw scale received.
>>
>> Add a new get_misc_doorbell() to get doorbell for misc capabilities to
>> use the doorbell with mhi events like MHI BW scale etc.
>>
>> Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
>> which will called by the mhi controller driver can sleep.
>>
>> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/bus/mhi/common.h        |  13 +++++
>>  drivers/bus/mhi/host/init.c     |  93 +++++++++++++++++++++++++++++++--
>>  drivers/bus/mhi/host/internal.h |   6 ++-
>>  drivers/bus/mhi/host/main.c     | 113 +++++++++++++++++++++++++++++++++++++++-
>>  drivers/bus/mhi/host/pm.c       |  10 +++-
>>  drivers/bus/mhi/host/trace.h    |   7 +++
>>  include/linux/mhi.h             |  13 +++++
>>  7 files changed, 247 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
>> index 4c316f3d5a68..267260901a41 100644
>> --- a/drivers/bus/mhi/common.h
>> +++ b/drivers/bus/mhi/common.h
>> @@ -215,6 +215,19 @@
>>  #define MHI_CAP_ID_MAX_TRB_LEN		0x5
>>  #define MHI_CAP_ID_MAX			0x6
>>  
>> +/* MHI Bandwidth scaling offsets */
>> +#define MHI_BW_SCALE_CFG_OFFSET		0x4
>> +#define MHI_BW_SCALE_CAP_ID		(3)
>> +#define MHI_BW_SCALE_DB_CHAN_ID		GENMASK(31, 25)
>> +#define MHI_BW_SCALE_ENABLED		BIT(24)
>> +#define MHI_BW_SCALE_ER_INDEX		GENMASK(23, 19)
>> +
>> +#define MHI_TRE_GET_EV_BW_REQ_SEQ(tre)	FIELD_GET(GENMASK(15, 8), (MHI_TRE_GET_DWORD(tre, 0)))
>> +
>> +#define MHI_BW_SCALE_RESULT(status, seq)	(FIELD_PREP(GENMASK(11, 8), status) | \
>> +						FIELD_PREP(GENMASK(7, 0), seq))
>> +#define MHI_BW_SCALE_NACK			0xF
> 0xf
>
>> +
>>  enum mhi_pkt_type {
>>  	MHI_PKT_TYPE_INVALID = 0x0,
>>  	MHI_PKT_TYPE_NOOP_CMD = 0x1,
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index 32db4aa4bbe8..d0975b6c2df0 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -497,10 +497,66 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
>>  	return 0;
>>  }
>>  
>> +static int mhi_get_er_index(struct mhi_controller *mhi_cntrl,
>> +			    enum mhi_er_data_type type)
>> +{
>> +	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>> +	int i;
>> +
>> +	/* Find event ring for requested type */
>> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>> +		if (mhi_event->data_type == type)
>> +			return mhi_event->er_index;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +static int mhi_init_bw_scale(struct mhi_controller *mhi_cntrl,
>> +			     int bw_scale_db)
>> +{
>> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	struct mhi_event *mhi_event;
>> +	u32 bw_cfg_offset, val;
>> +	int er_index, i;
>> +
>> +	bw_cfg_offset = mhi_find_capability(mhi_cntrl, MHI_BW_SCALE_CAP_ID);
>> +	if (!bw_cfg_offset)
>> +		return 0;
>> +
>> +	er_index = mhi_get_er_index(mhi_cntrl, MHI_ER_BW_SCALE);
>> +	if (er_index < 0)
>> +		return er_index;
>> +
>> +	/* Initialize BW scale event ring resources */
>> +	mhi_event = mhi_cntrl->mhi_event;
>> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>> +		if (mhi_event->data_type == MHI_ER_BW_SCALE) {
>> +			INIT_WORK(&mhi_event->work, mhi_process_ev_work);
>> +			mutex_init(&mhi_event->mutex);
> Why do you need mutex only for this event and not for other events?
For other events we are using spinlocks, we can't use spinlock for this event
as pci framework is using mutex locks internally as part of
pcie_set_target_speed()
>> +			break;
>> +		}
>> +	}
>> +
>> +	bw_cfg_offset += MHI_BW_SCALE_CFG_OFFSET;
>> +
>> +	/* Advertise host support */
>> +	val = FIELD_PREP(MHI_BW_SCALE_DB_CHAN_ID, bw_scale_db) |
>> +			 FIELD_PREP(MHI_BW_SCALE_ER_INDEX, er_index) |
>> +			 MHI_BW_SCALE_ENABLED;
>> +
>> +	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, bw_cfg_offset, val);
>> +
>> +	dev_dbg(dev, "Bandwidth scaling setup complete with event ring: %d\n",
>> +		er_index);
>> +
>> +	return 0;
>> +}
>> +
>>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  {
>> -	u32 val;
>> -	int i, ret;
>> +	u32 val, chdb_offset;
>> +	int i, ret, doorbell = 0;
>>  	struct mhi_chan *mhi_chan;
>>  	struct mhi_event *mhi_event;
>>  	void __iomem *base = mhi_cntrl->regs;
>> @@ -581,6 +637,8 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  		return -ERANGE;
>>  	}
>>  
>> +	chdb_offset = val;
>> +
>>  	/* Setup wake db */
>>  	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
>>  	mhi_cntrl->wake_set = false;
>> @@ -634,6 +692,17 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  		return ret;
>>  	}
>>  
>> +	if (mhi_cntrl->get_misc_doorbell)
>> +		doorbell = mhi_cntrl->get_misc_doorbell(mhi_cntrl, MHI_ER_BW_SCALE);
> Why can't you add the doorbell number to 'mhi_event_config'?
ack.
>> +
>> +	if (doorbell > 0) {
>> +		ret = mhi_init_bw_scale(mhi_cntrl, doorbell);
>> +		if (!ret)
>> +			mhi_cntrl->bw_scale_db = base + chdb_offset + (8 * doorbell);
>> +		else
>> +			dev_warn(dev, "Failed to setup bandwidth scaling: %d\n", ret);
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -778,6 +847,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>>  		case MHI_ER_CTRL:
>>  			mhi_event->process_event = mhi_process_ctrl_ev_ring;
>>  			break;
>> +		case MHI_ER_BW_SCALE:
>> +			mhi_event->process_event = mhi_process_bw_scale_ev_ring;
>> +			break;
>>  		default:
>>  			dev_err(dev, "Event Ring type not supported\n");
>>  			goto error_ev_cfg;
>> @@ -1001,10 +1073,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>>  
>>  		mhi_event->mhi_cntrl = mhi_cntrl;
>>  		spin_lock_init(&mhi_event->lock);
>> -		if (mhi_event->data_type == MHI_ER_CTRL)
>> +		if (mhi_event->data_type == MHI_ER_CTRL) {
>>  			tasklet_init(&mhi_event->task, mhi_ctrl_ev_task,
>>  				     (ulong)mhi_event);
>> -		else
>> +		} else if (mhi_event->data_type == MHI_ER_BW_SCALE) {
>> +		/* BW scale resources will be initialized in mhi_init_mmio() if capability exists */
> But you are just skipping the tasklet here. Provide an apt reason for that.
we are using workqueue, for bw scale, as we cannot use mutex in tasklet. I
will add a comment there.

- Krishna Chaitanya.
>
> - Mani
>

